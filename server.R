library(shiny)
library(ggplot2)
library(maps)
library(leaflet)
zipdata <- readRDS("zipdata.rds")
shinyServer(function(input, output) {
  
  output$map <- renderPlot({
    
    x <- c(input$gender, input$ethnicity, input$age)
    names(x) <- c("gender","ethnicity","age_bin")

    if(all(x == "all")){
      data <- zipdata
    }else if(length(which(x != "all")) == 1){
      data <- zipdata[which(zipdata[,names(x[which(x != "all")])] == x[which(x != "all")]), c("longitude","latitude")]
    }else if(length(which(x != "all")) == 2){
      x1 <- which(x != "all")[1]
      x2 <- which(x != "all")[2]
      data <- zipdata[which(zipdata[,names(x1)] == x[x1] & zipdata[,names(x2)] == x[x2]), c("longitude","latitude")]
    }else if(length(which(x != "all")) == 3){
      x1 <- which(x != "all")[1]
      x2 <- which(x != "all")[2]
      x3 <- which(x != "all")[3]
      data <- zipdata[which(zipdata[,names(x1)] == x[x1] & zipdata[,names(x2)] == x[x2] & zipdata[,names(x3)] == x[x3]), c("longitude","latitude")]
    }
    
    ggplot(data = data) + 
      geom_point(aes(x = longitude, y = latitude, color = "red", alpha = .5)) +
      theme_bw() + scale_x_continuous(limits = c(-125,-66), breaks = NULL) +
      scale_y_continuous(limits = c(25,50), breaks = NULL) + 
      labs(x = NULL, y = NULL) +
      geom_polygon(data = map_data("usa"), aes(x=long, y = lat, group = group), fill = NA, color = "grey") + 
      coord_fixed(1.3) + theme(legend.position = "none")
    
  })
  output$text <- renderText({
    
    x <- c(input$gender, input$ethnicity, input$age)
    names(x) <- c("gender","ethnicity","age_bin")

    if(all(x == "all")){
      data <- zipdata
    }else if(length(which(x != "all")) == 1){
      data <- zipdata[which(zipdata[,names(x[which(x != "all")])] == x[which(x != "all")]), c("longitude","latitude")]
    }else if(length(which(x != "all")) == 2){
      x1 <- which(x != "all")[1]
      x2 <- which(x != "all")[2]
      data <- zipdata[which(zipdata[,names(x1)] == x[x1] & zipdata[,names(x2)] == x[x2]), c("longitude","latitude")]
    }else if(length(which(x != "all")) == 3){
      x1 <- which(x != "all")[1]
      x2 <- which(x != "all")[2]
      x3 <- which(x != "all")[3]
      data <- zipdata[which(zipdata[,names(x1)] == x[x1] & zipdata[,names(x2)] == x[x2] & zipdata[,names(x3)] == x[x3]), c("longitude","latitude")]
    }
    
    paste0("Represents " , 100 * round(nrow(data)/nrow(zipdata), 4) , "%" , " of total sample.")
    
  })
  
})











