# Install required packages if not installed
# install.packages("shiny")
# install.packages("shinydashboard")
# install.packages("DBI")
# install.packages("RMySQL")

library(shiny)
library(shinydashboard)
library(DBI)
library(RMySQL)

# Connect to the MySQL database
con <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "notes_entry",
  host = "localhost",
  user = "root",
  password = "",
  port = 3306
)

# Fetch book data from the database based on BTID
fetch_book_data <- function(btid) {
  query <- sprintf("SELECT * FROM book WHERE btid = '%s'", btid)
  result <- dbGetQuery(con, query)
  return(result)
}

# Fetch student data from the issue table based on Student ID
fetch_student_data <- function(student_id) {
  query <- sprintf("SELECT * FROM issue WHERE sid = '%s'", student_id)
  result <- dbGetQuery(con, query)
  return(result)
}

# UI (User Interface)
ui <- dashboardPage(
  dashboardHeader(title = "Book Issue System"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Book Issue", tabName = "book_issue", icon = icon("book"),
               menuItem("Get Book Details", tabName = "get_book_details"),
               menuItem("Issue Book", tabName = "issue_book"),
               menuItem("Auto Issue", tabName = "auto_issue")
      )
    )
  ),
  dashboardBody(
    tabItems(
      # Get Book Details Tab
      tabItem(tabName = "get_book_details",
              h2("Get Book Details"),
              textInput("btid", "Enter Book Transaction ID (BTID)", ""),
              actionButton("get_book", "Get Book Details"),
              verbatimTextOutput("book_info")
      ),
      
      # Issue Book Tab
      tabItem(tabName = "issue_book",
              h2("Issue Book"),
              textInput("student_id", "Enter Student ID", ""),
              actionButton("get_student", "Get Student Details"),
              verbatimTextOutput("student_info"),
              textInput("book_btid", "Enter Book Transaction ID (BTID)", ""),
              textInput("book_name", "Enter Book Name", ""),
              textInput("author", "Enter Author Name", ""),
              dateInput("issue_date", "Select Date of Issue", value = Sys.Date()),
              numericInput("duration", "Enter Duration (Days)", value = 7, min = 1),
              textOutput("return_date"),
              actionButton("issue_book", "Issue Book"),
              textOutput("book_issue_result")
      ),
      
      # Auto Issue Tab
      tabItem(tabName = "auto_issue",
              h2("Auto Issue Book"),
              textInput("auto_student_id", "Enter Student ID", ""),
              actionButton("get_auto_student", "Get Student Details"),
              verbatimTextOutput("auto_student_info"),
              textInput("auto_book_id", "Enter Book Transaction ID (BTID)", ""),
              actionButton("issue_auto_book", "Issue Book"),
              textOutput("auto_issue_result")
      )
    )
  )
)

# Server (Backend Logic)
server <- function(input, output, session) {
  
  # Fetch and display book information from the database
  observeEvent(input$get_book, {
    book_data <- fetch_book_data(input$btid)
    if (nrow(book_data) > 0) {
      output$book_info <- renderPrint({
        paste("Book Transaction ID:", book_data$btid, "\n",
              "Book Name:", book_data$bname, "\n",
              "Author Name:", book_data$aname, "\n",
              "Issue Date:", book_data$idate, "\n",
              "Return Date:", book_data$rdate)
      })
    } else {
      output$book_info <- renderPrint("No book data found for the provided BTID.")
    }
  })
  
  # Fetch and display student information from the issue table
  observeEvent(input$get_student, {
    student_data <- fetch_student_data(input$student_id)
    if (nrow(student_data) > 0) {
      output$student_info <- renderPrint({
        paste("Student ID:", student_data$sid, "\n",
              "Student Tag:", student_data$stid, "\n",
              "Student Name:", student_data$sname)
      })
    } else {
      output$student_info <- renderPrint("Student not found.")
    }
  })
  
  # Fetch and display student information for Auto Issue
  observeEvent(input$get_auto_student, {
    student_data <- fetch_student_data(input$auto_student_id)
    if (nrow(student_data) > 0) {
      output$auto_student_info <- renderPrint({
        paste("Student ID:", student_data$sid, "\n",
              "Student Tag:", student_data$stid, "\n",
              "Student Name:", student_data$sname)
      })
    } else {
      output$auto_student_info <- renderPrint("Student not found.")
    }
  })
  
  # Calculate and display return date based on issue date and duration
  observe({
    if (!is.null(input$issue_date) && !is.null(input$duration)) {
      return_date <- as.Date(input$issue_date) + as.numeric(input$duration)
      output$return_date <- renderText({
        paste("Date of Return:", return_date)
      })
    }
  })
  
  # Book Issue logic after getting student details
  observeEvent(input$issue_book, {
    if (input$student_id != "" && input$book_btid != "" && input$book_name != "" && input$author != "") {
      return_date <- as.Date(input$issue_date) + as.numeric(input$duration)
      output$book_issue_result <- renderText({
        paste("Book Transaction ID:", input$book_btid, "\n",
              "Book Name:", input$book_name, "\n",
              "Author:", input$author, "\n",
              "Issued to Student ID:", input$student_id, "\n",
              "Date of Issue:", input$issue_date, "\n",
              "Duration:", input$duration, "days\n",
              "Date of Return:", return_date)
      })
      
      # Insert data into the iss_books table
      query <- sprintf(
        "INSERT INTO iss_books (student_id, student_name, book_id, book_name, author_name, issue_date, return_date, duration) 
        VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', %d)",
        input$student_id, input$student_id, input$book_btid, input$book_name, input$author,
        input$issue_date, return_date, input$duration
      )
      dbExecute(con, query)
    } else {
      output$book_issue_result <- renderText("Please fill in all fields for issuing the book.")
    }
  })
  
  # Auto Issue logic
  observeEvent(input$issue_auto_book, {
    if (input$auto_student_id != "" && input$auto_book_id != "") {
      student_data <- fetch_student_data(input$auto_student_id)
      book_data <- fetch_book_data(input$auto_book_id)
      if (nrow(student_data) > 0 && nrow(book_data) > 0) {
        return_date <- as.Date(Sys.Date()) + 7 # Default duration of 7 days
        output$auto_issue_result <- renderText({
          paste("Book Transaction ID:", input$auto_book_id, "\n",
                "Book Name:", book_data$bname, "\n",
                "Author:", book_data$aname, "\n",
                "Issued to Student ID:", student_data$sid, "\n",
                "Date of Issue:", Sys.Date(), "\n",
                "Duration:", 7, "days\n",
                "Date of Return:", return_date)
        })
        
        # Insert data into the iss_books table
        query <- sprintf(
          "INSERT INTO iss_books (student_id, student_name, book_id, book_name, author_name, issue_date, return_date, duration) 
          VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', %d)",
          student_data$sid, student_data$sname, input$auto_book_id, book_data$bname, book_data$aname,
          Sys.Date(), return_date, 7
        )
        dbExecute(con, query)
      } else {
        output$auto_issue_result <- renderText("Either student or book data not found.")
      }
    } else {
      output$auto_issue_result <- renderText("Please enter both Student ID and Book Transaction ID.")
    }
  })
  
  # Close the database connection when the app stops
  onStop(function() {
    dbDisconnect(con)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
