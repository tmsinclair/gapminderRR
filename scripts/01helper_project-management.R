#project management

#install relevant packages#
#install.packages("https://cran.rstudio.com/bin/windows/Rtools/")

#start a new script for your function
#usethis::use_r("calculate-percent-change-from-baseline")


#Make a description using the description function
#usethis::use_description()

#use pacman to complete the proj using
#' install and load dependencies through pkg "pacman"
pkgs <- c("dplyr")
if (!require("pacman")) { install.packages("pacman") }
pacman::p_load(pkgs, character.only = T)

#you can specify decpendent packages with use_package
#usethis::use_package("dplyr")

#when building tick 
#does git work?

usethis::use_github()

#create a MIT license
usethis::use_mit_license("Tom Sinclair")

#create a readme
usethis::use_readme_md("Tom Sinclair")

#use resolve #1 to close the issue
