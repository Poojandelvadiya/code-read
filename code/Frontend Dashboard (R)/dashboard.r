# Load required libraries
library(shiny)
library(shinydashboard)
library(DBI)
library(RMySQL)
library(DT)
library(lattice)  # For lattice plots
library(ggplot2)

# Define UI
ui <- dashboardPage(
  dashboardHeader(title = "College Library System"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Books", tabName = "books", icon = icon("book")),
      menuItem(
        "Add Book",
        icon = icon("plus"),
        menuSubItem("Manually", tabName = "add_book_manual"),
        menuSubItem("From CSV", tabName = "add_book_csv")
      ),
      menuItem("Search", tabName = "search", icon = icon("search")),
      menuItem("Download CSV Files", tabName = "download_csv", icon = icon("download")),
      menuItem("Usage Reports", icon = icon("chart-line"),
               menuSubItem("View Reports", tabName = "view_reports"),
               menuSubItem("Upload Reports", tabName = "upload_reports"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "dashboard",
        fluidRow(
          box(
            title = "Books Distribution by Department",
            status = "info",
            solidHeader = TRUE,
            width = 12,
            plotOutput("department_distribution_plot")
          ),
          box(
            title = "Total Entries",
            status = "primary",
            solidHeader = TRUE,
            width = 12,
            numericInput("total_entries", label = NULL, value = 0, min = 0, step = 1)
          )
        )
      ),
      tabItem(
        tabName = "books",
        DTOutput("books_table")
      ),
      tabItem(
        tabName = "add_book_manual",
        fluidRow(
          box(
            title = "Add New Book",
            status = "success",
            solidHeader = TRUE,
            width = 6,
            textInput("new_acc_no", label = "Access Number (Acc.No.)", value = "1", placeholder = "Enter Access Number"),
            textInput("new_title", label = "Title", placeholder = "Enter title"),
            textInput("new_author", label = "Author", placeholder = "Enter author"),
            textInput("new_publisher", label = "Publisher", placeholder = "Enter publisher"),
            numericInput("new_cost", label = "Cost", value = 0, min = 0),
            textInput("new_department", label = "Department", placeholder = "Enter department"),
            actionButton("add_book_btn_manual", label = "Add Book")
          )
        )
      ),
      tabItem(
        tabName = "add_book_csv",
        fluidRow(
          box(
            title = "Upload CSV to Add Books",
            status = "info",
            solidHeader = TRUE,
            width = 6,
            fileInput("upload_file", label = "Upload CSV file", accept = ".csv"),
            actionButton("add_book_btn_csv", label = "Add Books from CSV")
          )
        )
      ),
      tabItem(
        tabName = "search",
        fluidRow(
          box(
            title = "Search Books",
            status = "info",
            solidHeader = TRUE,
            width = 12,
            DTOutput("search_table")
          )
        )
      ),
      tabItem(
        tabName = "download_csv",
        fluidRow(
          box(
            title = "Download CSV Files",
            status = "success",
            solidHeader = TRUE,
            width = 6,
            selectInput("select_department", "Select Department", ""),
            downloadButton("download_results_btn", label = "Download Results (CSV)"),
            p("Download results in CSV format.")
          )
        )
      ),
      tabItem(
        tabName = "view_reports",
        fluidRow(
          box(title = "View Usage Reports", status = "primary", solidHeader = TRUE, width = 12,
              selectInput("report_name_view", "Select Report Name", 
                          choices = c("Library Footfalls", "Circulation Usage", 
                                      "Separate Reading Room Usage", "Periodical and Newspaper Usage", 
                                      "E Library Usage", "Reference Usage", 
                                      "OVERALL USAGE ANALYSIS")),
              selectInput("faculty_view", "Select Faculty", 
                          choices = c("FOET", "FOBC", "FOHS", "FOHSS", "FOS", "FOTE")),
              selectInput("year_view", "Select Year", 
                          choices = c("2018", "2019", "2020", "2021", "2022", "2023", "2024"), selected = "2023"),
              actionButton("view_report_btn", "View Report")
          ),
          box(title = "Library Footfalls Analysis", status = "info", solidHeader = TRUE, width = 12,
              plotOutput("graph_1")),
          box(title = "Total Library Footfall", status = "info", solidHeader = TRUE, width = 12,
              plotOutput("graph_2"))
        )
      ),
      tabItem(
        tabName = "upload_reports",
        fluidRow(
          box(title = "Upload CSV", status = "info", solidHeader = TRUE, width = 12,
              selectInput("report_name_upload", "Select Report Name", 
                          choices = c("Library Footfalls", "Circulation Usage", 
                                      "Separate Reading Room Usage", "Periodical and Newspaper Usage", 
                                      "E Library Usage", "Reference Usage", 
                                      "OVERALL USAGE ANALYSIS")),
              selectInput("faculty_upload", "Select Faculty", 
                          choices = c("FOET", "FOBC", "FOHS", "FOHSS", "FOS", "FOTE")),
              selectInput("year_upload", "Select Year", 
                          choices = c("2018", "2019", "2020", "2021", "2022", "2023", "2024"), selected = "2023"),
              fileInput("upload_csv", label = "Upload CSV file", accept = ".csv"),
              actionButton("save_to_db", "Save to Database")
          ),
          box(title = "Uploaded CSV Table Data", status = "info", solidHeader = TRUE, width = 12,
              DTOutput("uploaded_csv_table"))
        )
      )
    )
  )
)

# Server
server <- function(input, output, session) {
  con <- dbConnect(
    drv = RMySQL::MySQL(),
    dbname = "notes_entry",
    host = "localhost",
    user = "root",
    password = "",
    port = 3306
  )
  
  if (!dbExistsTable(con, "entries")) {
    dbWriteTable(con, "entries", data.frame(), row.names = FALSE)
  }
  
  if (!dbExistsTable(con, "entries2")) {
    dbWriteTable(con, "entries2", data.frame(), row.names = FALSE)
  }
  
  rv <- reactiveVal(dbGetQuery(con, "SELECT COUNT(*) FROM entries")$COUNT)
  
  output$books_table <- renderDT({
    books_data <- dbReadTable(con, "entries")
    datatable(books_data, options = list(pageLength = 10), filter = "top")
  })
  
  observe({
    rv(dbGetQuery(con, "SELECT COUNT(*) FROM entries")$COUNT)
    updateNumericInput(session, "total_entries", value = rv())
  })
  
  observeEvent(input$add_book_btn_manual, {
    new_book <- data.frame(
      AccNo = as.character(input$new_acc_no),
      Title = input$new_title,
      Author = input$new_author,
      Publisher = input$new_publisher,
      Cost = input$new_cost,
      Dept = input$new_department,
      Remark = "Available"
    )
    # Write data to entries table
    dbWriteTable(con, "entries", new_book, append = TRUE, row.names = FALSE)
    # Write the same data to entries2 table
    dbWriteTable(con, "entries2", new_book, append = TRUE, row.names = FALSE)
    updateNumericInput(session, "total_books", value = rv())
  })
  
  observeEvent(input$add_book_btn_csv, {
    file <- input$upload_file
    if (is.null(file)) return()
    
    uploaded_data <- read.csv(file$datapath)
    
    if (identical(names(uploaded_data), colnames(dbReadTable(con, "entries")))) {
      dbWriteTable(con, "entries", uploaded_data, append = TRUE, row.names = FALSE)
      dbWriteTable(con, "entries2", uploaded_data, append = TRUE, row.names = FALSE)
      updateNumericInput(session, "total_books", value = rv())
      
      # Check if views for the departments already exist, if not create them
      unique_departments <- unique(uploaded_data$Dept)
      for (department in unique_departments) {
        view_name <- gsub(" ", "_", department) # Replace spaces with underscores for view name
        
        if (!dbExistsTable(con, view_name)) {
          # If the view doesn't exist, create it
          create_view_query <- paste0("CREATE VIEW ", view_name, " AS SELECT Title, AccNo, Dept FROM entries WHERE Dept = '", department, "'")
          dbSendQuery(con, create_view_query)
        }
      }
      
    } else {
      showNotification("Error: Columns of uploaded data do not match the 'entries' table.", type = "error")
    }
  })
  
  
  observe({
    department_choices <- unique(dbReadTable(con, "entries")$Dept)
    updateSelectInput(session, "select_department", choices = department_choices)
  })
  
  output$download_results_btn <- downloadHandler(
    filename = function() {
      selected_department <- input$select_department
      paste0(selected_department, "_output.csv")
    },
    content = function(file) {
      selected_department <- input$select_department
      
      # Customize the query to dynamically select the view based on the selected department
      query <- paste0("SELECT Title, AccNo, Dept FROM ", selected_department)
      
      custom_data <- dbGetQuery(con, query)
      
      write.csv(custom_data, file, row.names = FALSE)
    },
    contentType = "text/csv" # Ensure this line is included
  )
  
  
  output$search_table <- renderDT({
    books_data <- dbReadTable(con, "entries2")
    
    search_table_data <- data.frame(
      Title = unique(books_data$Title),
      Access_Numbers = sapply(unique(books_data$Title), function(title) {
        acc_numbers <- paste(books_data$AccNo[books_data$Title == title], collapse = ", ")
        if (acc_numbers == "") acc_numbers <- "N/A"
        acc_numbers
      }),
      Department = sapply(unique(books_data$Title), function(title) {
        subset_data <- books_data[books_data$Title == title, ]
        unique(subset_data$Dept)
      }),
      Quantity = sapply(unique(books_data$Title), function(title) sum(books_data$Title == title))
    )
    
    search_table_data <- search_table_data[!duplicated(search_table_data$Access_Numbers), ]
    
    datatable(search_table_data, options = list(pageLength = 10), filter = "top", rownames = FALSE)
  })
  
  output$department_distribution_plot <- renderPlot({
    department_counts <- table(dbReadTable(con, "entries")$Dept)
    barplot(department_counts, main = "Books Distribution by Department", xlab = "Department", ylab = "Number of Books")
  })
  
  
  
  session$onSessionEnded(function() {
    dbDisconnect(con)
  })
  
  # Reactive value to store uploaded data
  uploaded_data <- reactiveVal(NULL)
  
  # Establish a connection to the MySQL database for reports
  con_reports <- dbConnect(RMySQL::MySQL(), dbname = "notes_reports", host = "localhost", user = "root", password = "")
  
  # Function to fetch data from the database
  fetch_data <- function(report_name, faculty, year) {
    table_name <- paste(tolower(faculty), year, gsub(" ", "_", tolower(report_name)), sep = "_")
    query <- paste("SELECT * FROM", table_name)
    data <- dbGetQuery(con_reports, query)
    
    # Reorder months
    data$Month <- factor(data$Month, levels = c("January", "February", "March", "April", "May", "June", 
                                                "July", "August", "September", "October", "November", "December"))
    
    return(data)
  }
  
  
  output$graph_1 <- renderPlot({
    req(input$view_report_btn)
    data <- fetch_data(input$report_name_view, input$faculty_view, input$year_view)
    
    # Handle missing values
    data <- na.omit(data)
    
    data$Month <- factor(data$Month)
    data$Staff <- as.numeric(as.character(data$Staff))
    data$Students <- as.numeric(as.character(data$Students))
    
    # Create ggplot object
    p <- ggplot(data, aes(x = Month))
    
    # Add lines for Staff and Students separately
    p + geom_line(aes(y = Staff, color = "Staff"), group = 1) +
      geom_point(aes(y = Staff, color = "Staff")) +
      geom_line(aes(y = Students, color = "Students"), group = 1) +
      geom_point(aes(y = Students, color = "Students")) +
      
      # Add text labels for each point
      geom_text(aes(label = ifelse(!is.na(Staff), Staff, ""), y = Staff), vjust = -0.5, size = 3, color = "blue") +
      geom_text(aes(label = ifelse(!is.na(Students), Students, ""), y = Students), vjust = -0.5, size = 3, color = "red") +
      
      # Customize appearance
      labs(title = "Footfalls by Month", x = "Month", y = "Number of Footfalls") +
      scale_color_manual(values = c(Staff = "blue", Students = "red")) +
      theme_minimal() +
      theme(legend.position = "top")
  })
  
  output$graph_2 <- renderPlot({
    req(input$view_report_btn)
    data <- fetch_data(input$report_name_view, input$faculty_view, input$year_view)
    
    # Handle missing values
    data <- na.omit(data)
    
    data$Month <- factor(data$Month)
    data$Total <- as.numeric(as.character(data$Total))
    
    barchart(Total ~ Month, data = data, main = "Total Footfalls", xlab = "Month", ylab = "Total", 
             col = "steelblue", horizontal = FALSE, scales = list(x = list(rot = 90)))
  })
  
  # Logic for handling file upload and saving to the database...
  
  # Observer for file upload
  observeEvent(input$upload_csv, {
    uploaded_data(read.csv(input$upload_csv$datapath))
  })
  
  # Saving uploaded data to database
  observeEvent(input$save_to_db, {
    if (!is.null(uploaded_data())) {
      table_name <- paste(tolower(input$faculty_upload), input$year_upload, gsub(" ", "_", tolower(input$report_name_upload)), sep = "_")
      dbWriteTable(con_reports, table_name, uploaded_data(), append = TRUE, row.names = FALSE)
      showNotification("Data saved successfully into the database.", duration = 5)
    }
  })
  
  # Render uploaded CSV data in a DataTable
  output$uploaded_csv_table <- renderDT({
    if (!is.null(uploaded_data())) {
      datatable(uploaded_data(), options = list(pageLength = 10))
    }
  })
  
  # Cleanup: disconnect from the database upon session end
  onSessionEnded(function() {
    dbDisconnect(con_reports)
  })
}

# Run the application
shinyApp(ui, server)
