#install gapminder
install.packages("gapminder")
#get the gapminder sataset
gapminder::gapminder

#install soem packages to write a .csv of the data
install.packages("here")
install.packages("tidyverse")
devtools::install_github("annakrystalli/metadatar")
#saves the file automatically within the root project directory
readr::write_csv(gapminder::gapminder, path = here::here("data/raw/gapminder.csv"))
#as different systems use differnt paths, you should use here("data","raw","gapminder.csv)


#reading in the .csv
gapminder_df <- readr::read_csv(here::here("data/raw/gapminder.csv"))

#look at the data
head(gapminder_df)

#look at the metsa shell function
?create_meta_shell

#create a dataframe for the data
gapminder_meta_shell <- metadatar::create_meta_shell(gapminder_df, factor_cols = c("country", "continent"))

#then write the file into the metadata folder
write.csv(gapminder_meta_shell, file = here::here("data/metadata/gapminder_meta_shell.csv"), 
          row.names = F)

#create a complete metadata
str(gapminder_df)
