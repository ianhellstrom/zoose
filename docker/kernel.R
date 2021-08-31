options(repos=structure(c(CRAN="cran.rstudio.com/")))
install.packages(c("repr", "IRdisplay", "IRkernel"), type = "source")

IRkernel::installspec(user = FALSE)

libs = c("bigrquery", "arrow", "tidyverse", "tidymodels", "lubridate", "randomForest", "caret", "reshape")
install.packages(libs, type = "source")
