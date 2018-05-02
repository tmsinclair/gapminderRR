install.packages(c("rmarkdown", "tidyverse", "plotly", "DT", "reprex", "broom", 
                   "kableExtra"))

usethis::use_git_config()

usethis::use_git_config(
  user.name = "tmsinclair",
  user.email = "tmsinclair2@sheffield.ac.uk")

usethis::browse_github_pat()

usethis::edit_r_environ()
