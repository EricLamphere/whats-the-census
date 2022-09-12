# DESCRIPTION
# -- Description: Census App: Server
# -- Author:      Eric Lamphere (ericjlamphere@gmail.com)
# -- Created:     Sat May 29 10:36:08 2021
# -- References:
# -- >


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  sex <- reactive({
    input$sex
  })

  output$sex_state_plot <- renderPlotly({
    plotly::plot_ly(
      data = sex_by_state %>%
        purrr::when(
          sex() == "both" ~ dplyr::filter(., sex != "overall"),
          TRUE ~ dplyr::filter(., sex == sex())
        ) %>%
        ezxfig::filter_remove_totals(c("state"), tv = "overall"),
      x = ~state,
      y = ~pop,
      color = ~sex,
      colors = c("#27F879", "#20A1F9"),
      type = "scatter",
      mode = "markers"
    ) %>%
      plotly::layout(
        title = "Population by State and Sex",
        legend = list(title=list(text='<b> Sex </b>')),
        xaxis = list(title = "Population"),
        yaxis = list(title = "State")
      )
  })

})
