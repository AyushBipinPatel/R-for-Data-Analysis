library(shiny)
library(tidyverse)
ui <- fluidPage(
    selectInput("x", "X variable", choices = names(iris)),
    selectInput("y", "Y variable", choices = names(iris)),
    plotOutput("plot")
)
server <- function(input, output, session) {
    output$plot <- renderPlot({
        ggplot(iris, aes(.data[[input$x]], .data[[input$y]],
                         colour = Species)) +
            geom_point(position = ggforce::position_auto())
    }, res = 96)
}
shinyApp(ui = ui, server = server)
