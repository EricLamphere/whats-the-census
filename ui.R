# DESCRIPTION
# -- Description: Census App: UI
# -- Author:      Eric Lamphere (ericjlamphere@gmail.com)
# -- Created:     Sat May 29 10:34:53 2021
# -- References:
# -- >



# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("2020 US Census"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            # selectInput("state", "State", unique(sex_by_state$state))
            selectInput("sex", "Sex", c("both", unique(sex_by_state$sex)))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotlyOutput("sex_state_plot")
        )
    )
))
