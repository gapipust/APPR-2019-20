library(shiny)

shinyUI(fluidPage(
  titlePanel("Nočitve po slovenskih občinah"),
  tabPanel("Število nočitev", DT::dataTableOutput("obcine")),
))