# DESCRIPTION
# -- Description: Census App: Server
# -- Author:      Eric Lamphere (ericjlamphere@gmail.com)
# -- Created:     Sat May 29 10:36:08 2021
# -- References:
# -- >


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })

})
