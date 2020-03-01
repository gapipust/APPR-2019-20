library(shiny)

shinyUI(fluidPage(
  titlePanel("Nočitve po slovenskih občinah"), 
  DT::dataTableOutput("obcine"))
)