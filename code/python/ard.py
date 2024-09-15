import serial
import mysql.connector
from mysql.connector import Error
import time

# Configure Serial Port
SERIAL_PORT = 'COM6'  # Update this to the correct port
BAUD_RATE = 9600

def initialize_serial():
    try:
        ser = serial.Serial(SERIAL_PORT, BAUD_RATE, timeout=1)
        print("Serial port initialized.")
        return ser
    except serial.SerialException as e:
        print(f"Error initializing serial port: {e}")
        return None

def initialize_database():
    try:
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='',
            database='notes_entry'
        )
        if conn.is_connected():
            print("Database connection successful.")
            return conn
    except Error as e:
        print(f"Error connecting to database: {e}")
        return None

def read_rfid(serial_conn, previous_rfid):
    if serial_conn.in_waiting > 0:
        rfid_data = serial_conn.readline().decode('utf-8').strip()
        if rfid_data != previous_rfid:  # Only return new, non-duplicate RFID data
            print(f"RFID Data Read: {rfid_data}")  # Debugging: Show what data is read
            return rfid_data
    return None

def fetch_student_name(student_id, db_conn):
    cursor = db_conn.cursor(dictionary=True)
    cursor.execute("SELECT sname FROM students WHERE stid = %s", (student_id,))
    student_data = cursor.fetchone()
    if student_data:
        return student_data['sname']
    return None

def fetch_book_name(book_id, db_conn):
    cursor = db_conn.cursor(dictionary=True)
    cursor.execute("SELECT bname FROM books WHERE bid = %s", (book_id,))
    book_data = cursor.fetchone()
    if book_data:
        return book_data['bname']
    return None

def issue_book_to_student(student_id, student_name, book_id, book_name, db_conn):
    issue_date = time.strftime('%Y-%m-%d')
    return_date = time.strftime('%Y-%m-%d', time.localtime(time.time() + 7 * 24 * 60 * 60))
    duration = 7
    
    cursor = db_conn.cursor()
    issue_query = """
    INSERT INTO iss_books (student_id, student_name, book_id, book_name, issue_date, return_date, duration)
    VALUES (%s, %s, %s, %s, %s, %s, %s)
    """
    cursor.execute(issue_query, (student_id, student_name, book_id, book_name, issue_date, return_date, duration))
    db_conn.commit()

    print(f"Book '{book_name}' issued successfully to student '{student_name}'!")

def process_rfid_data(student_id, book_id, db_conn):
    if student_id and book_id:
        student_name = fetch_student_name(student_id, db_conn)
        book_name = fetch_book_name(book_id, db_conn)
        
        if student_name and book_name:
            print(f"Student Name: {student_name}")
            print(f"Book Name: {book_name}")
            issue_book_to_student(student_id, student_name, book_id, book_name, db_conn)
            return True
        else:
            print("Student or book not found.")
    return False

def main():
    serial_conn = initialize_serial()
    if not serial_conn:
        return
    
    db_conn = initialize_database()
    if not db_conn:
        serial_conn.close()
        return

    try:
        student_id = None
        book_id = None
        previous_rfid = None

        while True:
            rfid_tag = read_rfid(serial_conn, previous_rfid)

            if rfid_tag:
                previous_rfid = rfid_tag

                if rfid_tag.startswith("Student RFID:"):
                    student_id = rfid_tag.split(":")[1].strip()
                    print(f"Student RFID Detected: {student_id}")
                    student_name = fetch_student_name(student_id, db_conn)
                    if student_name:
                        print(f"Student Name: {student_name}")
                    else:
                        print("Student not found.")

                elif rfid_tag.startswith("Book RFID:"):
                    book_id = rfid_tag.split(":")[1].strip()
                    print(f"Book RFID Detected: {book_id}")
                    book_name = fetch_book_name(book_id, db_conn)
                    if book_name:
                        print(f"Book Name: {book_name}")
                    else:
                        print("Book not found.")

                # Process data only if both student and book RFID have been scanned
                if student_id and book_id:
                    if process_rfid_data(student_id, book_id, db_conn):
                        # Reset for the next transaction
                        student_id = None
                        book_id = None

            time.sleep(1)  # Delay to avoid spamming console
    except KeyboardInterrupt:
        print("Program terminated.")
    finally:
        serial_conn.close()
        db_conn.close()

if __name__ == '__main__':
    main()
