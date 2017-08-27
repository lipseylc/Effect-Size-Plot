library(shiny)
library(ggplot2)
library(dplyr)

source("data_loading.R")
source("data_reformat.R")
source("function.R")

shinyUI(
  fluidPage(
    
    titlePanel("PRIME Project Results"),
    sidebarLayout(
      sidebarPanel(selectInput("Dataset","Choose the Dataset",choices = c("Prospects" = "Pros_","LSAY" = "LSAY_","ECLSK" = "ECLSK_"),selected = "Pros_"),
                   radioButtons("Subject","Select the subject",list("Math" = "M","Reading (ECLSK & Prospects)" = "R","Science (LSAY)" = "S"),"M"),
                   selectInput("Comparison","Select the comparison",choices = c("Bias Comparison" = "B", "Method Comparison" = "M"),selected = "M"),
                   selectInput("Grade","Select the Grade",choices = c("P1" = "P1", "P2" = "P2", "P3" = "P3"),selected = "P1"),
                   checkboxGroupInput("Methods", "Select the Methods to show:", c("OLS" = "OLS_", "PS as covariate" = "ps_", "PS Weight" = "weight_", "Matching" = "match_"), selected="OLS_"),
                   checkboxGroupInput("Bias","Select the Bias",choices = c("ES.05" = "Bias1", "ES.10" = "Bias2", "ES.15" = "Bias3", "ES.20" = "Bias4", "ES.25" = "Bias5", "ES.30" = "Bias6", "ES.40" = "Bias7", "ES.50" = "Bias8"),selected="Bias1"),
                   sliderInput("Xlim","Slect the Xlim", min = 0, max = 1, value = 0.5, step = 0.1),
                   sliderInput("Ylim","Slect the Ylim", min = 15, max = 50, value = 20, step = 5)
                   ),
            mainPanel(("Plot will be here"),
                plotOutput("myplot")
                )
      )))
    