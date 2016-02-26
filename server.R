library(shiny)
library(dplyr)
library(beepr)
library(plyr)
library(ggplot2)
library(tidyr)



education <- read.csv("Z:/Ferguson 13 march/other assignment/DS/Coursera/Courses/Developing Data Products/testApp/district.csv")
education$factor <- factor(education$factor, labels = c("class", "school", "teacher"))
education$district <- factor(education$district, labels = c("larkana", "thatta"))

Aes <- aes(
  x = percentage, 
  y = gender
)

Segment <- geom_segment(
  aes(yend = gender), 
  xend = 0, 
  color = "grey50",
  size = 1
)


Point <- geom_point(
  aes(colour = factor(gender)), size = 4,show.legend  = TRUE) 



Theme <- theme_grey() +
  theme(
    panel.grid.major.y = element_blank(),
    legend.justification = c(1, 0.5)
  )




shinyServer(function(input, output){
  dataset<- reactive({education[education$district==input$District & education$factor==input$Factor, ]})
  
  output$plot<- renderPlot({
    print(ggplot(dataset(), aes(x = percentage, y = gender)) +
            xlab("Ratio")+
            ylab("Gender")+
            Segment+Point + 
            facet_grid( ~ level, scales = "free_y", space = "free_y")+
            Theme+
            theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=20, hjust=0))+
            theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=15))+
            labs(color = NULL)  +theme(legend.title = element_blank())+
            theme(panel.border = element_rect(linetype = "dashed", colour = "black", fill = NA))+
            theme(axis.title=element_text(size=12)) + xlab("Number of Students")+
            theme(axis.title.y = element_blank()) +
            theme(strip.text.x = element_text(size = 12, face = "bold")))
  })
  
})