import serial
import pyttsx3

engine = pyttsx3.init()
engine.setProperty('rate', 120)
engine.setProperty('volume', 1)
voices = engine.getProperty('voices')

engine.setProperty('voice', voices[1].id)

ser = serial.Serial('COM6', 9600)  # Replace 'COMx' with the correct port (e.g., 'COM5')


try:
    while True:
        line = ser.readline().strip().decode('utf-8')  # Read a line from the serial port and decode it
        print(line)
        
        if 'Book:' in line:
            book = line.replace('Book: ', '')
            engine.say(book) 
            engine.runAndWait()

except KeyboardInterrupt:
    ser.close()  # Close the serial port when the program is interrupted
