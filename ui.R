library(shiny)
library(shinyAce)



shinyUI(bootstrapPage(

    headerPanel("Screening Data"),


########## Adding loading message #########

tags$head(tags$style(type="text/css", "
#loadmessage {
position: fixed;
top: 0px;
left: 0px;
width: 100%;
padding: 10px 0px 10px 0px;
text-align: center;
font-weight: bold;
font-size: 100%;
color: #000000;
background-color: #CCFF66;
z-index: 105;
}
")),

conditionalPanel(condition="$('html').hasClass('shiny-busy')",
tags$div("Loading...",id="loadmessage")),

#-----------------------------------------#

    mainPanel(
        tabsetPanel(

        tabPanel("Main",

            strong('Option:'),

            checkboxInput("colname", label = strong("The input data includes variable names (header)."), value = T),

            br(),

            p(HTML("<b><div style='background-color:#FADDF2;border:1px solid black;'>The editor below only accepts tab-separated values copied and pasted from Excel/Numbers. </div></b>")),

            aceEditor("text", value="i01\ti02\ti03\ti04\ti05\ti06\ti07\ti08\ti09\ti10\n1\t\t\t\t1\t1\t1\t1\t1\t1\n1\t1\t1\t1\t1\t1\t1\t1\t1\t1\n1\t1\t1\t1\t1\t1\t1\t1\t1\t1\n1\t0\t0\t1\t1\t1\t1\t1\t0\t1\n1\t1\t1\t1\t1\t1\t1\t1\t0\t1\n1\t0\t0\t1\t1\t1\t0\t1\t1\t1\n1\t1\t1\t1\t1\t1\t1\t1\t1\t1\n1\t0\t1\t1\t1\t1\t0\t1\t1\t1\n1\t0\t1\t1\t1\t1\t1\t1\t1\t1\n1\t1\t1\t1\t1\t1\t1\t1\t1\t1\n1\t1\t1\t1\t1\t1\t1\t1\t0\t1\n1\t1\t1\t1\t1\t1\t1\t1\t1\t1\n1\t1\t1\t1\t1\t1\t1\t1\t0\t1\n1\t0\t1\t1\t1\t1\t1\t1\t1\t1\n1\t1\t1\t1\t1\t1\t1\t1\t0\t1\n1\t0\t1\t1\t0\t1\t1\t1\t0\t1\n1\t0\t1\t1\t1\t1\t1\t1\t1\t1\n1\t0\t1\t1\t1\t1\t0\t1\t1\t1\n1\t1\t1\t1\t1\t1\t1\t1\t0\t1\n1\t0\t1\t1\t1\t1\t1\t1\t0\t\n1\t1\t1\t1\t1\t1\t1\t1\t1\t1\n1\t0\t1\t1\t1\t0\t0\t1\t0\t1\n1\t1\t1\t1\t0\t1\t1\t1\t1\t1\n1\t1\t1\t1\t1\t1\t1\t1\t1\t1\n1\t0\t0\t1\t1\t0\t0\t1\t1\t1\n1\t0\t1\t1\t1\t1\t1\t1\t1\t1\n1\t0\t1\t1\t0\t1\t0\t1\t1\t1\n1\t0\t1\t1\t1\t1\t1\t1\t1\t1\n1\t1\t1\t1\t1\t1\t1\t1\t0\t1",
                mode="r", theme="cobalt"),

            br(),

            h3("Checking missing/non-numeric values"),
            verbatimTextOutput("textarea.out"),

            br(),

            h3("Summary of the data"),
            verbatimTextOutput("min.max.out"),

            br(),
            br(),

            strong('R session info'),
            verbatimTextOutput("info.out")

            ),


        tabPanel("About",

            strong('Note'),
            p('This web application is developed with',
            a("Shiny.", href="http://www.rstudio.com/shiny/", target="_blank"),
            ''),

            br(),

            strong('List of Packages Used'), br(),
            code('library(shiny)'),br(),
            code('library(shinyAce)'),br(),


            br(),

            strong('Code'),
            p('Source code for this application is based on',
            a('"The handbook of Research in Foreign Language Learning and Teaching" (Takeuchi & Mizumoto, 2012).', href='http://mizumot.com/handbook/', target="_blank")),

            p('The code for this web application is available at',
            a('GitHub.', href='https://github.com/mizumot/screenData', target="_blank")),

            p('If you want to run this code on your computer (in a local R session), run the code below:',
            br(),
            code('library(shiny)'),br(),
            code('runGitHub("screenData","mizumot")')
            ),

            br(),

            strong('Citation in Publications'),
            p('Mizumoto, A. (2015). Langtest (Version 1.0) [Web application]. Retrieved from http://langtest.jp'),

            br(),

            strong('Article'),
            p('Mizumoto, A., & Plonsky, L. (2015).', a("R as a lingua franca: Advantages of using R for quantitative research in applied linguistics.", href='http://applij.oxfordjournals.org/content/early/2015/06/24/applin.amv025.abstract', target="_blank"), em('Applied Linguistics,'), 'Advance online publication. doi:10.1093/applin/amv025'),

            br(),

            strong('Recommended'),
            p('To learn more about R, I suggest this excellent and free e-book (pdf),',
            a("A Guide to Doing Statistics in Second Language Research Using R,", href="http://cw.routledge.com/textbooks/9780805861853/guide-to-R.asp", target="_blank"),
            'written by Dr. Jenifer Larson-Hall.'),

            p('Also, if you are a cool Mac user and want to use R with GUI,',
            a("MacR", href="https://sites.google.com/site/casualmacr/", target="_blank"),
            'is defenitely the way to go!'),

            br(),

            strong('Author'),
            p(a("Atsushi MIZUMOTO,", href="http://mizumot.com", target="_blank"),' Ph.D.',br(),
            'Associate Professor of Applied Linguistics',br(),
            'Faculty of Foreign Language Studies /',br(),
            'Graduate School of Foreign Language Education and Research,',br(),
            'Kansai University, Osaka, Japan'),

            br(),

            a(img(src="http://i.creativecommons.org/p/mark/1.0/80x15.png"), target="_blank", href="http://creativecommons.org/publicdomain/mark/1.0/"),

            p(br())

            )

))
))