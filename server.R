

shinyServer(function(input, output) {
  # Filter data based on selections
  
  
  output$map <- renderGvis({
    
    gvisGeoChart(data=scores_time,
                 locationvar="state", colorvar=input$scores_cost,
                 options=list(region="US", displayMode="regions", 
                              resolution="provinces",
                              width=500, height=400,
                              colorAxis="{colors:['#FFFFFF', '#0000FF']}"
                 ))     
  
  })
  
 
  
 


  output$expense_type <- renderGvis({

    # if (input$score_choice == 'Math Score') {}
    gvisScatterChart(expense[,3:5],
                    options=list(legend="none", pointSize=2,
                                 title="Achievement Level by Spending Type" 
                                 ))
    
  })
  
  
  output$table <- DT::renderDataTable(DT::datatable({
    
    data <- data.frame(scores_time, stringsAsFactors = FALSE, row.names = NULL)
    
    if (input$st != "All") {
      data <- data[data$state == input$st,]
    }
    if (input$yr != "All") {
      data <- data[data$year == input$yr, ]
    }
    
    data
  }))
  
  

})
