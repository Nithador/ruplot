#' Test
#'
#' @param df_data data.frame with data. First column is deciding time and needs to be ascending
#' @param opts list of options
#' @param width integer, widget width
#' @param height integer, widget height
#' @param elementId HTML container element ID
#' @param digits how many decimanl digits should JSON parser use? Use I() to specify significant digits. Use NA for max precision. Higher number results in much slower parsing. Default is 4.
#' @import htmlwidgets
#'
#' @examples
#'
#' \dontrun{
#' df_data <- data.frame(x = 1:100,
#'                       y = rnorm(100))
#' options <- list(title = "My Chart",
#'                 id = "chart1",
#'                 class = "my-chart",
#'                 width = 800,
#'                 height = 600,
#'                 scales = list(x = list(time = FALSE)),
#'                 series = list(NULL,
#'                               list(stroke = "red",
#'                                    width = 1,
#'                                    label = "Test")))
#' uplot(df_data,
#'       options)
#' }
#' @export
uplot <- function(df_data,
                  opts,
                  width = NULL,
                  height = NULL,
                  elementId = NULL,
                  digits = 4) {

  # transform data to columnar json data
  l_data <- data_constructor(df_data)

  # pass the data and settings using 'x'
  x <- list(
    data = l_data,
    opts = opts
  )

  # Make sure the toJSON function handles nulls as list, creates {} instead of null.
  # This is important since the first argument in series should usually be {}
  attr(x, 'TOJSON_ARGS') <- list(null = "list",
                                 digits = digits)

  # create the widget
  htmlwidgets::createWidget("uplot",
                            x,
                            width = width,
                            height = height,
                            package = "uPlot",
                            elementId = elementId
                            )

}
