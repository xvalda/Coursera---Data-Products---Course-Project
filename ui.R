library(shiny)

shinyUI(fluidPage(
    titlePanel(HTML("Linear relations between variables of the mtcars dataset")),
    # user inputs requested predictor and outcome
    sidebarLayout(
        sidebarPanel(
            h3("Choose a predictor (X-axis): "),
            selectInput("inputPredictor", label = NULL, choices = c("Displacement"="disp", "Cylinders"="cyl",
                                                    "Miles per Gallon"="mpg", "Horsepower"="hp", "Rear Axle Ratio"="drat",
                                                    "Weight"="wt", "1/4 Mile Time"="qsec", "vs"="vs",
                                                    "Transmission"="am", "Gears"="gear", "Carburator"="carb")),
            h3("Choose the outcome variable (Y-axis): "),
            selectInput("inputOutcome", label = NULL, choices = c("Miles per Gallon"="mpg", "Cylinders"="cyl", "Displacement"="disp",
                                                                  "Horsepower"="hp", "Rear Axle Ratio"="drat",
                                                                  "Weight"="wt", "1/4 Mile Time"="qsec", "vs"="vs",
                                                                  "Transmission"="am", "Gears"="gear", "Carburator"="carb")),
            #show in side pane the intercept, slope and R-Squared
            h3("Intercept"),
            textOutput("interceptOut"),
            h3("Slope"),
            textOutput("slopeOut"),
            h3("R-Squared"),
            textOutput("rsquaredtOut")

        ),

        # Plot the liner model
        mainPanel(

            HTML('<p>Choose the predictor and outcome in the left pane to plot the corresponding linear model.</p>
                 <p>The intercept, slope and R-squared value are shown in the left pane.
                 <a href="https://github.com/xvalda/Coursera---Data-Products---Course-Project">The source code is available on Github.</a>
                 </p>
                 '),

            # br(),

            plotOutput("plotLM")
            )
        )
    ))
