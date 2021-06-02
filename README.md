<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

# uPlot R integration

This package is a wrapper for extremely fast, small, and pretty time series visualization library
[uPlot](https://github.com/leeoniya/uPlot) by Leon Sorokin.

# Status

At the moment this is the first crude wrapper.
I have a vision of expanding the package by many helper function,
if possible with syntax similar to R package [dygraphs](https://github.com/rstudio/dygraphs), for easy conversion.
Not sure at this stage if it will be possible.

This version contains one main function `uplot()`, with parameters `data`, `opts` and `digits`.
- `data` should be a data.frame or list of vectors with first column/vector of ascending numbers equivalent to the x-axis points.
Each further column is one time series.
- `opts` should be a list of options which are passed to the original `uPlot` library.
- `digits` is the number of digits which JSON parser will use. I found out the default 16 may be quite slow for large data. (This will be most likely changed to opts_json in future versions to allow greater control of the parser)

It also contains `renderUplot()` and `uplotOutput()` functions for use in  `shiny` apps.

# Installation
Installation is now possible using `devtools` package

```
devtools::install_github("nithador/ruplot")
```
 
or `remotes` package

```
remotes::install_github("nithador/ruplot")
```

# Usage

``` r
library(uPlot)

opts <- list(
  title = "Signal",
  id = "chart1",
  class = "uplot-chart",
  scales = list(x = list(time = FALSE),
                y = list(range = c(-130, 130))),
  # Next two lines enable highlight
  focus = list(alpha = 0.3),
  cursor = list(focus = list( prox = 30),
                # This enables zooming in x and y axis
                drag = list(x = TRUE, y = TRUE)),
  series = list(
   # First NULL is for the x-axis definition
    NULL,
    list(
      stroke = "red",
      width = 1,
      label = "Series 1",
      points = list(color = "red",
                    fill = "red",
                    space = 0,
                    size = 5)
    ),
    list(
      stroke = "blue",
      width = 0,
      label = "Series 2",
      points = list(color = "blue",
                    fill = "blue",
                    space = 0,
                    size = 5)
    )
  )
)

df_data <- list(a = c(1:8e2),
                b = rnorm(8e1, 10),
                c = rnorm(8e2, 20))


uplot(df_data,
      opts,
      digits = 16)
```
