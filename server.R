library(shiny)
library(shinyAce)
library(tabplot)
library(beeswarm)


shinyServer(function(input, output) {


    vartype <- reactive({
        
            dat <- read.csv(text=input$text, header = TRUE, sep="\t", na.strings=c("","NA","."))
            sapply(dat,class)
    
    })
    
    output$vartype.out <- renderPrint({
        vartype()
    })





    missing <- reactive({
        
            dat <- read.csv(text=input$text, header = TRUE, sep="\t", na.strings=c("","NA","."))
            
            # Checking missing values or NAs
            fin <- function(obj){
                sapply(obj,FUN = function(x) all(is.finite(x)))
            }
            
            # Checking non-numeric values
            num <- function(obj){
                sapply(obj,FUN = function(x) all(is.numeric(x)))
            }
            
            res <- data.frame(fin(dat), num(dat))
            colnames(res) <- c("Finite (FALSE=Missing Value)", "Numeric (FALSE=Non-numeric)")
            res
    
    })
    
    output$textarea.out <- renderPrint({
        missing()
    })

    



    min.max <- reactive({
        
            dat <- read.csv(text=input$text, header = TRUE, sep="\t", na.strings=c("","NA","."))
            summary(dat, digits = 1)
    
    })
    
    output$min.max.out <- renderPrint({
        min.max()
    })
    
    
    
    
    
    tabPlot <- function(){
       
        dat <- read.csv(text=input$text, header = TRUE, sep="\t", na.strings=c("","NA","."))
        tableplot(dat)
    
    }
    
    output$tabPlot <- renderPlot({
        print(tabPlot())
    })


    
    

    output$varselect <- renderUI({
        
            dat <- read.csv(text=input$text, header = TRUE, sep="\t", na.strings=c("","NA","."))
            colf <- grep("factor", sapply(dat, class))
            datn <- dat[,-c(colf)] # numeric only
            cols <- names(datn)
            selectInput("vars", "Click the box below and select variables:", choices=cols, multiple=T)

    })
    
    
    
    
    makeboxPlot <- function(){
        
        if (is.null(input$vars)){
            
            NULL
        
        } else {
        
        dat <- read.csv(text=input$text, header = TRUE, sep="\t", na.strings=c("","NA","."))
        dat <- data.frame(dat[,input$vars])
        
        boxplot(dat, las=1, xlab= "Means and +/-1 SDs are displayed in red.")
        
            if (input$beeswarm == 0) {
                NULL
            } else {
                beeswarm(dat, col = 4, pch = 16, vert = TRUE,  add = TRUE)
            }
        
            for (i in 1:ncol(dat)) {
                pts <- 0.2 + i
                mns <- mean(dat[,i], na.rm=TRUE)
                sds <- sd(dat[,i], na.rm=TRUE)
                points(pts, mns, pch = 18, col = "red", cex = 2)
                arrows(pts, mns, pts, mns + sds, length = 0.1, angle = 45, col = "red")
                arrows(pts, mns, pts, mns - sds, length = 0.1, angle = 45, col = "red")
            }

        }
    }
    
    output$boxPlot <- renderPlot({
        print(makeboxPlot())
    })
    
    




    info <- reactive({
        info1 <- paste("This analysis was conducted with ", strsplit(R.version$version.string, " \\(")[[1]][1], ".", sep = "")
        info2 <- paste("It was executed on ", date(), ".", sep = "")
        cat(sprintf(info1), "\n")
        cat(sprintf(info2), "\n")
    })
    
    output$info.out <- renderPrint({
        info()
    })


})
