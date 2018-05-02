install.packages(c("rmarkdown", "tidyverse", "plotly", "DT", "reprex", "broom", 
                   "kableExtra"))

#see what credentials are in tehre already
usethis::use_git_config()

#input your credentials
usethis::use_git_config(
  user.name = "tmsinclair",
  user.email = "tmsinclair2@sheffield.ac.uk")

#get a PAT, a unique identifier for this project
usethis::browse_github_pat()

#add the PAT code to the environ
usethis::edit_r_environ()

#start using git!
usethis::use_git(message = "Initial commit", pkg = ".")

#you might need to restart during this process