library(shiny)
library(shinyAce)



shinyServer(function(input, output) {


    
    missing <- reactive({
        if (input$colname == 0) {
            dat <- read.table(text=input$text, sep="\t")
            
            # Checking missing values or NAs
            fin <- function(obj){
                sapply(obj, FUN = function(x) all(is.finite(x)))
            }
            
            # Checking non-numeric values
            num <- function(obj){
                sapply(obj,FUN = function(x) all(is.numeric(x)))
            }
            
            res <- data.frame(fin(dat), num(dat))
            colnames(res) <- c("Finite (FALSE=Missing Value)", "Numeric (FALSE=Non-numeric)")
            res
            
        } else {
            
            dat <- read.table(text=input$text, header = TRUE, sep="\t")
            
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
        
        }
    })
    
    output$textarea.out <- renderPrint({
        missing()
    })

    



    min.max <- reactive({
        
        if (input$colname == 0) {
            dat <- read.table(text=input$text, sep="\t")
            summary(dat, digits = 1)
            
        } else {
            dat <- read.table(text=input$text, header = TRUE, sep="\t")
            summary(dat, digits = 1)
            
            # 変数の最小値をチェック
            #min.dat <- function(obj){
            #sapply(obj,FUN = function(x) min(x, na.rm=T))
            #}
            
            # 変数の最大値をチェック
            #max.dat <- function(obj){
            #sapply(obj,FUN = function(x) max(x, na.rm=T))
            #}
            
            #res <- data.frame(min.dat(dat), max.dat(dat))
            #colnames(res) <- c("Min", "Max")
            #res
        }
    })
    
    output$min.max.out <- renderPrint({
        min.max()
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
