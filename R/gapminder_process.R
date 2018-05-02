# create a function  to calculate the relative population increase between two years
rel_pop_get <- function(df, base_year){
  df$pop_rel <- df$pop/df$pop[df$year == base_year]
  df
}

gapmider_rel_pop <- function(gapminder_df, base_year = 1952) {
  
  # check that the base year is a valid year. 
  valid_b_y <- base_year %in% unique(gapminder_df$year) & is.numeric(base_year)
  if (!valid_b_y) {
    stop("base_year ", base_year,
         " not a valid year in gapminder dataset. \nValid years are: ", 
         paste(unique(gapminder_df$year), collapse = ","))
  }
  
  # group by country and calculate population relative to baseline year
  gapminder_df %>%
    dplyr::filter(year >= base_year) %>% 
    dplyr::group_by(country) %>% dplyr::do(rel_pop_get(., base_year)) %>%
    dplyr::ungroup()
}

#Roxygen2 documentation makes writing functions and their relative helpfiles easier
#install.packages("roxygen2")

#call a Roxygen skellington with "Code > Insert Roxygen Skeleton" from the menu bar

#' Title
#'
#' @param gapminder_df This is the first input parameter
#' @param base_year This is the second input parameter
#'
#' @return This is the output
#' @export This tells R to export the function with a help file
#'
#' @import From package1 package2 %>% This says which packages with functions 
#'              you've used in your own function (the pipe needs doing separately)
#' @examples
gapmider_rel_pop <- function(gapminder_df, base_year = 1952) {
  
  # check that the base year is a valid year. 
  valid_b_y <- base_year %in% unique(gapminder_df$year) & is.numeric(base_year)
  if (!valid_b_y) {
    stop("base_year ", base_year,
         " not a valid year in gapminder dataset. \nValid years are: ", 
         paste(unique(gapminder_df$year), collapse = ","))
  }
  
  # group by country and calculate population relative to baseline year
  gapminder_df %>%
    dplyr::filter(year >= base_year) %>% 
    dplyr::group_by(country) %>% dplyr::do(rel_pop_get(., base_year)) %>%
    dplyr::ungroup()
}

#An example for the above function

#' Calculate population relative to a baseline year
#'
#' Calculate population at different timepoints, for each country in the gapminder 
#' dataset relative to a baseline year. Append result to the dataframe as a new column.
#' @param gapminder_df dataframe of gapminder data
#' @param base_year numeric. Year to be taken as baseline for the calculation of 
#' of relative population change
#'
#' @return gapminder_df with relative population added as column pop_rel 
#' @export
#'
#' @importFrom dplyr %>%
#' @examples
gapmider_rel_pop <- function(gapminder_df, base_year = 1952) {
  
  # check that the base year is a valid year. 
  valid_b_y <- base_year %in% unique(gapminder_df$year) & is.numeric(base_year)
  if (!valid_b_y) {
    stop("base_year ", base_year,
         " not a valid year in gapminder dataset. \nValid years are: ", 
         paste(unique(gapminder_df$year), collapse = ","))
  }
  
  # group by country and calculate population relative to baseline year
  gapminder_df %>%
    dplyr::filter(year >= base_year) %>% 
    dplyr::group_by(country) %>% dplyr::do(rel_pop_get(.)) %>%
    dplyr::ungroup()
}

#As the following function is not being exported full documentation is not necessary
  #(but still should be done)
# calculate population relative to a baseline year from gapminder single country 
# subset
rel_pop_get <- function(df) {
  df$pop_rel <- df$pop/df$pop[df$year == base_year]
  df
}

gapmider_rel_pop <- function(gapminder_df, base_year) {
  
  # check that the base year is a valid year. 
  valid_b_y <- base_year %in% unique(gapminder_df$year) & is.numeric(base_year)
  if (!valid_b_y) {
    stop("base_year ", base_year,
         " not a valid year in gapminder dataset. \nValid years are: ", 
         paste(unique(gapminder_df$year), collapse = ","))
  }
  
  # group by country and calculate population relative to baseline year
  gapminder_df %>%
    dplyr::filter(year >= base_year) %>% 
    dplyr::group_by(country) %>% dplyr::do(rel_pop_get(., base_year)) %>%
    dplyr::ungroup()
}

gapminder_df.relative.pop <- gapmider_rel_pop(gapminder_df, 1952)

gapminder_df.relative.pop$pop_perc <- (gapminder_df.relative.pop$pop_rel - 1)*100

gapmider_perc_pop <- function(gapminder_df, base_year) {
  
  # check that the base year is a valid year. 
  valid_b_y <- base_year %in% unique(gapminder_df$year) & is.numeric(base_year)
  if (!valid_b_y) {
    stop("base_year ", base_year,
         " not a valid year in gapminder dataset. \nValid years are: ", 
         paste(unique(gapminder_df$year), collapse = ","))
  }
  
  # group by country and calculate population relative to baseline year
  gapminder_df.relative.pop <- gapmider_rel_pop(gapminder_df, base_year)
  
  gapminder_df.relative.pop$pop_perc <- (gapminder_df.relative.pop$pop_rel - 1)*100
  gapminder_df.relative.pop
}

gapmider_perc_pop(gapminder_df, 1952)
