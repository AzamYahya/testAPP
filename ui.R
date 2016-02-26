library(shiny)
education <- read.csv("Z:/Ferguson 13 march/other assignment/DS/Coursera/Courses/Developing Data Products/testApp/district.csv")
district_type <- unique(education$district)
factor_type <- unique(education$factor)




shinyUI(pageWithSidebar(
  
  #Title of Application
  headerPanel("Education Situation"), 
  
  sidebarPanel( 
    
    radioButtons("District", "District:", 
                choices= c("larkana","thatta")),
    
    selectInput("Factor", "Ratio of Student to:", 
                choices= c("class", "school", "teacher")),
    
    
    
    h5("This shiny application gives an output plot for education situation.
       These measures are for two districts of pakistan i.e. Thatta and
       Larkana. The districts are given are shown in the first tab shown
       by radio button. The three measures are student-class ratio,
       student-teacher ratio and student-school ratio. These measures are
       shown in the second tab that is the drop down menu. ")
    
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Plot", plotOutput("plot"))
      
    )
  )
  
  #end of UI brackets
))