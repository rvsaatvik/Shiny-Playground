

# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#


library(shiny)
library(markdown)


shinyUI
(
          fluidPage
          (
               titlePanel("Athena - Test"),
     
               sidebarLayout
               (
                    sidebarPanel(selectInput("artist1", "Enter Artist", choices = c("ANDY WARHOL","PABLO PICASSO","CHRISTO") )),
               
                    mainPanel
                    (
                         plotOutput("CompPlot"),
                         tableOutput('tbl')
                    )
                )
          )
)