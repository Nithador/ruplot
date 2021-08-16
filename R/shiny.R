#' Shiny bindings for uplot
#'
#' Output and render functions for using uplot within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended. \code{height} will probably not
#'   have an effect; instead, use the \code{height} parameter in
#'   \code{\link[uPlot]{uplot}}.
#' @param expr An expression that generates a uplot
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name uplot-shiny
#' @export
uplotOutput <- function(outputId, width = "100%", height = "400px") {
  shinyWidgetOutput(outputId, "uplot", width, height,
                    package = "uPlot")
}
#' @name uplot-shiny
#' @export
renderUplot <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, uplotOutput, env, quoted = TRUE)
}
