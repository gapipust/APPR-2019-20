#shiny

library(shiny)

shinyServer(function(input, output) {
  output$obcine <- DT::renderDataTable({
    obcine %>% spread(key=obcina, value=stevilo.nocitev) %>% rename(`Občina`=obcina)
  })
})