Run following code in R console:

    shiny::runGitHub("szwd_mapmaker_simple", "0zg", host ="0.0.0.0", port =1234)

*Current Version*: 0.1.2

# mapmaker_simple : upload csv, show map

Uses leaflet for the map and has a data tab. 
Not much to say. You upload a CSV and get to see the lat-lon GPS plotted on a map.
Just a few configurations are available, to avoid choice-stress (https://en.wikipedia.org/wiki/The_Paradox_of_Choice#Why_we_suffer )

## References:

none

# Installation

First, download and install R:

    https://cran.rstudio.com

Second, install required R packages:

    # set package repository to R 4.2.2 snapshot
    setRepositories(addURLs = c(MRAN_R422="https://packagemanager.posit.co/cran/2022-11-01"),ind=0)
    
    # create package list
    packages <- c( "htmlwidgets","DT","shiny","leaflet","dplyr" )
    
    # create already installed package list, and install new packages
    installed_packages <- packages %in% rownames(installed.packages())
    if (any(installed_packages == FALSE)) {
      install.packages(packages[!installed_packages]) }


Finally, run following code in R console:

    library(shiny)
    shiny::runGitHub( "szwd_mapmaker_simple", "0zg" )


# License

none
