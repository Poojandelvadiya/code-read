library(shiny)
library(shinydashboard)
library(RMySQL)
library(serial)

# Establish serial connection with Arduino (adjust the port as per your system)
serial_conn <- serial::serial(port = "COM6", baud = 9600, timeout = 1)  # Adjust "COM3" to your port

# Function to read RFID from Arduino
read_rfid <- function() {
  if (serial::available(serial_conn)) {
    rfid_data <- serial::read(serial_conn, 100)  # Read up to 100 bytes
    return(trimws(rfid_data))  # Trim whitespace from the received data
  }
  return(NULL)
}

# Define UI for the Shiny app
ui <- dashboardPage(
  dashboardHeader(title = "RFID Book Issue System"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Issue Book", tabName = "issue_book", icon = icon("book")),
      menuSubItem("Manual Book Issue", tabName = "manual_issue"),
      menuSubItem("Auto RFID Issue", tabName = "auto_issue")
    )
  ),
  dashboardBody(
    tabItems(
      # Manual Book Issue Tab
      tabItem(
        tabName = "manual_issue",
        fluidRow(
          box(title = "Enter Student ID", textInput("student_id", "Student ID")),
          actionButton("fetch_student", "Fetch Student"),
          verbatimTextOutput("student_info"),
          box(title = "Enter Book Information",
              textInput("book_btid", "Book ID"),
              textInput("book_name", "Book Name"),
              textInput("author", "Author"),
              dateInput("issue_date", "Date of Issue", value = Sys.Date()),
              numericInput("duration", "Duration (days)", value = 7),
              actionButton("issue_book", "Issue Book"),
              verbatimTextOutput("book_issue_result"))
        )
      ),
      # Auto RFID Issue Tab
      tabItem(
        tabName = "auto_issue",
        fluidRow(
          box(title = "RFID Book Issue System", verbatimTextOutput("auto_issue_result")),
          actionButton("rfid_read", "Read RFID")
        )
      )
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  # Open the database connection once
  con <- dbConnect(
    drv = RMySQL::MySQL(),
    dbname = "notes_entry",
    host = "localhost",
    user = "root",
    password = "",
    port = 3306
  )
  
  # Manual Book Issue Logic
  observeEvent(input$fetch_student, {
    student_id <- input$student_id
    query <- "SELECT * FROM issue WHERE sid = ?"
    student_data <- dbGetQuery(con, query, params = list(student_id))
    
    if (nrow(student_data) > 0) {
      output$student_info <- renderText({
        paste("Student ID:", student_data$sid, "\nName:", student_data$sname)
      })
    } else {
      output$student_info <- renderText("Student not found.")
    }
  })
  
  # Issue Book
  observeEvent(input$issue_book, {
    return_date <- as.Date(input$issue_date) + as.numeric(input$duration)
    
    query <- "INSERT INTO iss_books (student_id, book_id, book_name, author_name, issue_date, return_date, duration) 
              VALUES (?, ?, ?, ?, ?, ?, ?)"
    
    dbExecute(con, query, params = list(input$student_id, input$book_btid, input$book_name, input$author, 
                                        input$issue_date, return_date, input$duration))
    
    output$book_issue_result <- renderText("Book issued successfully!")
  })
  
  # Auto RFID Issue Logic
  observeEvent(input$rfid_read, {
    student_id <- read_rfid()
    book_id <- read_rfid()
    
    if (!is.null(student_id) && !is.null(book_id)) {
      query_student <- "SELECT * FROM issue WHERE stid = ?"
      student_data <- dbGetQuery(con, query_student, params = list(student_id))
      
      if (nrow(student_data) > 0) {
        student_name <- student_data$sname
        query_issue <- "INSERT INTO iss_books (student_id, student_name, book_id, issue_date, return_date, duration)
                        VALUES (?, ?, ?, ?, ?, ?)"
        dbExecute(con, query_issue, params = list(student_data$sid, student_name, book_id, Sys.Date(), Sys.Date() + 7, 7))
        output$auto_issue_result <- renderText(paste("Book", book_id, "issued to", student_name, "successfully!"))
      } else {
        output$auto_issue_result <- renderText("Student not found.")
      }
    } else {
      output$auto_issue_result <- renderText("Error reading RFID tags.")
    }
  })
  
  # Close the database connection and serial connection when the session ends
  session$onSessionEnded(function() {
    dbDisconnect(con)
    serial::close(serial_conn)  # Close the serial connection
  })
}

# Run the Shiny app
shinyApp(ui, server)
