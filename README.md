Run following code in R console:

    shiny::runGitHub("nla_kaart_timeline", "0zg", host ="0.0.0.0", port =1234, launch.browser = TRUE) 

*Current Version*: 0.1.2

# nla_kaart_timeline : upload csv, show map, play with timeslider

Uses leaflet for the map and has a data import tab. 
Not much to say. You upload a CSV and get to see the lat-lon GPS plotted on a map.

## References:

none

# Installation

First, download and install R:

    https://cran.rstudio.com

Second, install required R packages:

    # set package repository to R 4.2.2 snapshot
    setRepositories(addURLs = c(PRAN_R422="https://packagemanager.posit.co/cran/2022-11-01"),ind=0)
    
    # create package list
    packages <- c( "htmlwidgets","DT","shiny","leaflet","dplyr" )
    
    # create already installed package list, and install new packages
    installed_packages <- packages %in% rownames(installed.packages())
    if (any(installed_packages == FALSE)) {
      install.packages(packages[!installed_packages]) }


Finally, run following code in R console:

    library(shiny)
    shiny::runGitHub("nla_kaart_timeline", "0zg", host ="0.0.0.0", port =1234, launch.browser = TRUE) 

    


# License

MIT
