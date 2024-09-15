import serial
import pyttsx3
import os

engine = pyttsx3.init()
engine.setProperty('rate', 120)
engine.setProperty('volume', 1)
voices = engine.getProperty('voices')
engine.setProperty('voice', voices[1].id)

def read_from_serial(ser):
    while True:
        line = ser.readline().strip().decode('utf-8')
        if line.startswith('RFID Tag:'):
            access_number = line.replace('RFID Tag:', '').strip()
            print("Access Number:", access_number)
            engine.say(f"Access Number {access_number}")
            engine.runAndWait()

def write_to_serial(ser, data):
    try:
        ser.write(data.encode())
        print("Data written successfully.")
    except serial.SerialException as e:
        print(f"Error writing to serial port: {e}")

def run_r_shiny_dashboard():
    # Assuming sound1.R contains valid R code
    os.system("Rscript sound1.R")

def main():
    ser = serial.Serial('COM6', 9600)
    try:
        while True:
            choice = input("Choose an option:\n1. Read from serial\n2. Write to serial\n3. Run R Shiny Dashboard\n4. Quit\n")
            if choice == '1':
                read_from_serial(ser)
            elif choice == '2':
                data_to_write = input("Enter data to write (press q to quit): ")
                if data_to_write.lower() == 'q':
                    continue
                write_to_serial(ser, data_to_write)
            elif choice == '3':
                run_r_shiny_dashboard()
            elif choice == '4':
                break
            else:
                print("Invalid choice. Please enter 1, 2, 3, or 4.")
    finally:
        ser.close()  # Close the serial port when done

if __name__ == "__main__":
    main()
