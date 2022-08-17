options(repos=structure(c(CRAN="cran.rstudio.com/")))
install.packages(c('repr', 'IRdisplay', 'IRkernel'), type = 'source')

IRkernel::installspec(user = FALSE)

libs = c(
    "arrow",
    "bigrquery",
    "caret",
    "lubridate",
    "randomForest",
    "reshape",
    "tidyverse",
    "tidymodels",
    "languageserver"
    )
install.packages(libs, type = "source")
