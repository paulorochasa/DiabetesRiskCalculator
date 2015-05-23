#Ui on fluid page with mobile optimization

library(shiny)

shinyUI(fluidPage(

        title = "Diabetes mellitus risk calculator",
        h3("Diabetes mellitus risk calculator"),
        div(style="text-align:right;",a("Know more about this app",href="http://paulorochasa.github.io/DiabetesRiskCalculator/", target="_blank")),
        hr(),
        tags$form(
                fluidRow(
                        column(2,
                               img(src="person.png")
                        ),
                        column(4,
                               selectInput("age", "Age (years):", choices = ages)
                        ),
                        column(3, 
                               selectInput("bmi", "BMI (Kg/m2):",choices = bmiList)
                        ),
                        column(3, 
                               selectInput("waist", "Waist (cm) by gender:",choices = waistList)
                        )
                ),
                br(),
                fluidRow(
                        
                        column(2,
                               img(src="fruit.png")
                        ),
                        column(4,
                               selectInput("sport", "Practice any sport:", 
                                           choices = list("Yes"="0","No"="1"))
                        ),
                        column(3,
                               selectInput("eat", "Eat vegetables or fruit:", 
                                           choices = list("Everyday"="0","Sometimes/never"="1"))
                        ) 
                ),
                br(),
                fluidRow(
                        
                        column(2,
                               img(src="heart.png")
                        ),
                        column(4,
                               selectInput("medication", "Hypertension medication intake:", 
                                           choices = list("No"="0","Yes"="1"))
                        ),
                        column(3,
                               selectInput("glucose", "High blood glucose:", 
                                           choices = list("No"="0","Yes"="1"))
                        ) 
                ),
                br(),
                fluidRow(
                        
                        column(2,
                               img(src="family.png")
                        ),
                        column(4,
                               selectInput("family", "Family history of diabetes mellitus:", 
                                           choices = list("No"="0",
                                                          "Yes - Grandparents, direct uncles/aunts or cousins"="1",
                                                          "Yes - Parents, simblings or children"="2"))
                        )
                ),
                br(),
                div(style="text-align:center",submitButton("Calculate risk"))    
        ),
        hr(),
        fluidRow(
                
                column(6,
                       h3("Risk score"),
                       htmlOutput("ScoreOutput")
                ),
                column(6,
                       div(class="well",
                           h4("Metric version"),
                           h5("To use this calculator select the options above and click \"Calculate Risk\" to know your \"Risk Score\"."),
                           h5("How calculate bmi?"),
                           code("Bmi = Weight in kilograms / (Height in meters)^2"),
                           br(),
                           h5("Score possible results:"),
                           HTML("<small>
                                        <strong style=\"color:lightgreen\">Low</strong> (<7) &nbsp; - &nbsp; 
                                        <strong style=\"color:darkgreen\">Slight</strong> (7-11) &nbsp; - &nbsp; 
                                        <strong style=\"color:gold\">Moderate</strong> (12-14) &nbsp; - &nbsp; 
                                        <strong style=\"color:red\">High</strong> (15-20) &nbsp; -
                                        <strong style=\"color:darkred\">Severe</strong> (>20)
                                </small>")
                        )
                )
        )
))
