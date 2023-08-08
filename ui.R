#
# Ozgur Sonmez
# NLA - 2023
# RHiny app voor maken Kaart met Tijdlijn slider (input csv)
# 
#
#   
#
# backwards compatibility
# # set package repository to R 4.2.2 snapshot
# setRepositories(addURLs = c(MRAN_R422="https://packagemanager.posit.co/cran/2022-11-01"),ind=0)
# 
# # create package list
# packages <- c( "htmlwidgets","DT","shiny","leaflet","dplyr" )
# 
# # create already installed package list, and install new packages
# installed_packages <- packages %in% rownames(installed.packages())
# if (any(installed_packages == FALSE)) {
#   install.packages(packages[!installed_packages]) }
# 
# shiny::runGitHub("nla_kaart_timeline", "0zg", host ="0.0.0.0", port =1234)

library(htmlwidgets )
library(DT)
library(shiny)

library(leaflet)
library(RColorBrewer)
library(scales)
library(lattice)
library(dplyr)


# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
    navbarPage("TeamDab Kaart met Tijdlijn", id="nav",
         tabPanel("Import CSV", value="tab1",
                  
                  # Input: Select a file ---
                  fileInput("file1", "Kies een CSV bestand met postcodes en/of coordinaten om deze op de kaart te tonen. \n Ook moet de CSV een kolom genaamd 'tijdslider' bevatten. \n Klik hierna op 'Toon de punten op de kaart' om de kaart te vullen met de coordinaat gegevens van je CSV.",
                            multiple = TRUE,
                            accept = c("text/csv",
                         "text/comma-separated-values,text/plain",
                         ".csv")),
                  
                  # Horizontal line ----
                  tags$hr(),
                  # Input: Select separator ----
                  radioButtons("sep", "Scheidingsteken",
                               choices = c(Puntkomma = ";",
                                           Komma = ","),
                               selected = ";"),
                  tags$hr(),
                  actionButton("showmap", "Toon de punten op de kaart"),
                  tags$br(),tags$br(),
                  verbatimTextOutput("txt1", placeholder = TRUE),
                  tags$br(),tags$br(),
                  tableOutput("contents")
                  
                  ),   
         tabPanel("kaart", value="tab2",

            div(class="outer",
                
                tags$head(
                    # Include our custom CSS
                    includeCSS("styles.css"),
                    includeScript("gomap.js")
                ),
                
                # If not using custom CSS, set height of leafletOutput to a number instead of percent
                leafletOutput("map", width="100%", height="100%"),
                absolutePanel(top = 100, left = 10,
                              sliderInput("timeslider", "Datum Tijd of volgorde", 1, 60, value = c(2,5)
                                          , step = 1, sep = "", animate = animationOptions(interval = 600, loop = TRUE) )
                ),
                
                tags$div(id="cite",
                         'Data compiled for ', tags$em('NLA TeamDab A&O, 2020–2023'), ' by 0zg.'
                )
            )
         )
    )

))

