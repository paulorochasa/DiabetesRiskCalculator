library(shiny)

#Load score datasets
score.data<-read.csv("RiskDiabetesScoreTable.csv", header = TRUE, sep=";")
score.summary<-read.csv("RiskDetails.csv", header = TRUE, sep=";")

#Server function to render the risk score
shinyServer(function(input, output) { 
        output$ScoreOutput <- renderUI({
                
                #calc the risk score (sum of all scores by selected option)
                score.val <- sum(score.data[score.data$field=='age' & score.data$option==as.numeric(input$age),c('score')],
                                 score.data[score.data$field=='bmi' & score.data$option==as.numeric(input$bmi),c('score')],
                                 score.data[score.data$field=='waist' & score.data$option==as.numeric(input$waist),c('score')],
                                 score.data[score.data$field=='sport' & score.data$option==as.numeric(input$sport),c('score')],
                                 score.data[score.data$field=='eat' & score.data$option==as.numeric(input$eat),c('score')],
                                 score.data[score.data$field=='medication' & score.data$option==as.numeric(input$medication),c('score')],
                                 score.data[score.data$field=='glucose' & score.data$option==as.numeric(input$glucose),c('score')],
                                 score.data[score.data$field=='family' & score.data$option==as.numeric(input$family),c('score')]
                                 )
                
                #For each score rank setup ui data
                if (score.val<7){ 
                        score.color <- "lightgreen";
                        score.description <- score.summary[score.summary$id==1,c('score')];
                        score.detail <- score.summary[score.summary$id==1,c('detail')]
                }
                else if (score.val>=7 & score.val<=11)
                { 
                        score.color <- "darkgreen"
                        score.description <- score.summary[score.summary$id==2,c('score')];
                        score.detail <- score.summary[score.summary$id==2,c('detail')]
                }
                else if (score.val>=12 & score.val<=14)
                { 
                        score.color <- "gold"
                        score.description <- score.summary[score.summary$id==3,c('score')];
                        score.detail <- score.summary[score.summary$id==3,c('detail')]
                } 
                else if (score.val>=15 & score.val<=20) 
                { 
                        score.color <- "red"
                        score.description <- score.summary[score.summary$id==4,c('score')];
                        score.detail <- score.summary[score.summary$id==4,c('detail')]
                } 
                else if (score.val>20) 
                { 
                        score.color <- "darkred"
                        score.description <- score.summary[score.summary$id==5,c('score')];
                        score.detail <- score.summary[score.summary$id==5,c('detail')]
                } 
                
                #return the render HTML elements to render              
                div(
                    div(style=paste("text-align:center;font-size:40px;font-weight:bolder;color:",score.color),score.val),
                    br(),
                    HTML(paste("<p>Detail:<strong>",score.description,"</strong> - ",score.detail,"</p>"))
                )
        })
})
