library(shiny)

shinyServer(function(input, output) {
  output$obcine <- DT::renderDataTable({
    obcine %>% rename("Občina"=obcina, "Število nočitev"=stevilo.nocitev)
  })
})