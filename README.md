# shinyUIkit <img src="man/figures/UIkit_hex.svg" width=200 align="right" />

[![CRAN status](https://www.r-pkg.org/badges/version/shinyUIkit)](https://cran.r-project.org/package=shinyUIkit)
[![Travis build status](https://travis-ci.org/RinteRface/shinyUIkit.svg?branch=master)](https://travis-ci.org/RinteRface/shinyUIkit)

> [UIkit](https://getuikit.com) API for shiny 

# Demo

Soon

# Note for developers
- This build uses UIkit 3.0.3 (the first release was built on top of 3.0.0 rc 16)
- UIkit tabs do not render shiny output elements by default. Need to add some
[items](https://getbootstrap.com/docs/3.3/javascript/#tabs) from boostrap 3.3.6 to make it run properly. This is not the perfect solution but it works well.