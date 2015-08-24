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

            p(HTML("<b><div style='background-color:#FADDF2;border:1px solid black;'>The editor below only accepts tab-separated values copied and pasted from Excel/Numbers. </div></b>")),

            aceEditor("text", value="Group\tGender\tAbility\tPre\tPost\nA\tMale\t130\t29\t36\nA\tMale\t152\t37\t35\nA\tMale\t148\t29\t41\nA\tMale\t\t47\t52\nA\tMale\t122\t29\t41\nA\tMale\t126\t17\t35\nA\tMale\t122\t33\t35\nA\tMale\t150\t32\t48\nA\tMale\t148\t34\t39\nA\tMale\t124\t35\t34\nA\tMale\t136\t11\t18\nA\tMale\t128\t29\t48\nA\tMale\t132\t44\t45\nA\tMale\t\t39\t43\nA\tMale\t144\t30\t38\nA\tMale\t130\t36\t27\nA\tMale\t128\t30\t24\nA\tMale\t132\t28\t37\nA\tMale\t124\t38\t38\nA\tMale\t130\t28\t28\nA\tMale\t130\t46\t46\nA\tFemale\t136\t43\t38\nA\tFemale\t\t28\t33\nA\tFemale\t120\t45\t46\nA\tFemale\t138\t28\t24\nA\tFemale\t120\t14\t27\nA\tFemale\t152\t50\t49\nA\tFemale\t136\t30\t30\nA\tFemale\t140\t27\t46\nA\tFemale\t134\t47\t54\nA\tFemale\t122\t32\t38\nA\tFemale\t134\t37\t34\nA\tFemale\t152\t34\t47\nA\tFemale\t90\t26\t32\nA\tFemale\t144\t36\t34\nA\tFemale\t\t27\t38\nA\tFemale\t130\t26\t32\nA\tFemale\t128\t38\t38\nA\tFemale\t140\t38\t37\nA\tFemale\t148\t27\t32\nA\tFemale\t146\t38\t38\nA\tFemale\t134\t29\t32\nB\tMale\t148\t37\t49\nB\tMale\t134\t29\t35\nB\tMale\t102\t22\t31\nB\tMale\t118\t19\t43\nB\tMale\t136\t36\t41\nB\tMale\t152\t35\t53\nB\tMale\t126\t17\t22\nB\tMale\t126\t26\t21\nB\tMale\t136\t41\t51\nB\tMale\t148\t25\t37\nB\tMale\t114\t37\t51\nB\tMale\t128\t38\t47\nB\tMale\t128\t33\t50\nB\tMale\t110\t29\t40\nB\tMale\t128\t30\t37\nB\tMale\t\t23\t40\nB\tMale\t140\t33\t44\nB\tMale\t132\t15\t29\nB\tMale\t124\t32\t40\nB\tMale\t146\t25\t43\nB\tMale\t150\t32\t44\nB\tFemale\t148\t35\t42\nB\tFemale\t138\t27\t40\nB\tFemale\t128\t36\t42\nB\tFemale\t126\t31\t35\nB\tFemale\t138\t24\t37\nB\tFemale\t134\t31\t41\nB\tFemale\t136\t21\t34\nB\tFemale\t134\t28\t40\nB\tFemale\t122\t31\t41\nB\tFemale\t130\t35\t44\nB\tFemale\t142\t31\t34\nB\tFemale\t122\t35\t41\nB\tFemale\t138\t35\t41\nB\tFemale\t140\t36\t45\nB\tFemale\t128\t23\t47\nB\tFemale\t142\t34\t45\nB\tFemale\t140\t44\t50\nB\tFemale\t112\t40\t36\nB\tFemale\t128\t26\t38\nC\tMale\t126\t16\t35\nC\tMale\t\t27\t34\nC\tMale\t96\t20\t23\nC\tMale\t122\t27\t23\nC\tMale\t118\t14\t14\nC\tMale\t134\t26\t41\nC\tMale\t94\t20\t20\nC\tMale\t144\t31\t30\nC\tMale\t112\t30\t43\nC\tMale\t126\t22\t24\nC\tMale\t146\t37\t43\nC\tMale\t128\t36\t34\nC\tMale\t134\t26\t39\nC\tMale\t128\t30\t34\nC\tMale\t116\t15\t20\nC\tMale\t116\t28\t33\nC\tMale\t140\t24\t29\nC\tMale\t152\t39\t41\nC\tMale\t134\t29\t36\nC\tMale\t\t19\t23\nC\tMale\t130\t34\t27\nC\tFemale\t132\t21\t35\nC\tFemale\t104\t12\t15\nC\tFemale\t110\t30\t39\nC\tFemale\t130\t18\t31\nC\tFemale\t126\t25\t38\nC\tFemale\t118\t21\t36\nC\tFemale\t98\t16\t26\nC\tFemale\t126\t33\t43\nC\tFemale\t100\t28\t36\nC\tFemale\t134\t32\t32\nC\tFemale\t122\t35\t29\nC\tFemale\t134\t20\t20\nC\tFemale\t144\t36\t38\nC\tFemale\t\t16\t24\nC\tFemale\t126\t37\t39\nC\tFemale\t120\t29\t21\nC\tFemale\t142\t20\t21\nC\tFemale\t132\t24\t22\nC\tFemale\t122\t26\t32\nC\tFemale\t138\t37\t27",
                mode="r", theme="cobalt"),

            br(),

            h3("Type of variables"),
            verbatimTextOutput("vartype.out"),

            br(),

            h3("Checking missing/non-numeric values"),
            verbatimTextOutput("textarea.out"),

            br(),

            h3("Summary of the data"),
            verbatimTextOutput("min.max.out"),

            br(),

            h3("Visualisation of multivariate datasets"),
            plotOutput("tabPlot", width="100%"),

            br(),
            br(),

            h3("Boxplot (applicable for numeric values only)"),
            uiOutput("varselect"),
            checkboxInput("beeswarm", label = strong("Plot individual data points."), value = T),

            plotOutput("boxPlot"), #, width="80%"

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