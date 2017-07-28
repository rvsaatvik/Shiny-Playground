
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(readr)
library(ggplot2)
library(dplyr)
library(data.table)

dataset_art <- read_csv("data_phillips.csv")


shinyServer(function(input, output) {
     
     output$CompPlot <- renderPlot({
     
     df = dataset_art %>% select(artist,price_usd_hammer,yearCreated,result) %>% filter(result == "sold")  %>% filter(artist == input$artist1)   
     df$yearCreated = as.numeric(df$yearCreated) 
     
     df = dataset_art %>% select(artist,price_usd_hammer,yearCreated,result) %>% filter(result == "sold")  %>% filter(artist == input$artist1) %>% group_by(artist,yearCreated) %>% summarise(total = n())
     df = subset(df,yearCreated >= 1900 & yearCreated <= 2017)
          
     ggplot(data=df, 
                aes(x=as.numeric(yearCreated), y=total, group=artist, colour=artist)) +
                geom_line() +
                geom_point()
     })
     
     output$tbl <-  renderTable({
          
          head(dataset_art, n = 10)
          
          })

})
