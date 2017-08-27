


shinyServer(
  function(input, output) {
    
    myplot_data = reactive({if(input$Comparison == "B"){
      plot_data_b(input$Bias,input$Methods,input$Grade,input$Subject,input$Dataset)
    }else{
      plot_data_m(input$Methods,input$Bias,input$Grade,input$Subject,input$Dataset)
    }
    })
    

    output$myBias = renderText(input$Bias)
    output$myComparison = renderText(input$Comparison)
    output$myMethods = renderText(length(input$Methods))
    output$mydata_holder2 = renderTable(myplot_data())
    output$myplot = renderPlot({
      ggplot(myplot_data(),aes(x=Bias))+
        geom_density(aes(colour = Group),alpha=0.5,size=1)+
        xlim(-0.1, input$Xlim)+ ylim(0,input$Ylim) +labs(x='Adjusted ES')
    })
  }
) 