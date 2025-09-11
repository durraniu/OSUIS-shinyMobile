#' Mobile page wrapper
#'
#' @param ... Content.
#' @param navbar Slot for \link{f7_navbar}.
#' @param toolbar Slot for \link{f7_toolbar}.
#' @param title Tab title.
#' @export
f7_page <- function(..., navbar, toolbar, title = NULL) {
  tagList(
    shiny::tags$head(
      shiny::tags$meta(charset = "utf-8"),
      shiny::tags$meta(
        name = "viewport",
        content = "width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, viewport-fit=cover"
      ),
      shiny::tags$meta(
        name = "apple-mobile-web-app-capable",
        content = "yes"
      ),
      shiny::tags$meta(
        name = "theme-color",
        content = "#2196f3"
      ),
      shiny::tags$title(title)
    ),
    add_dependencies(
      shiny::tags$body(
        shiny::tags$div(
          id = "app",
          shiny::tags$div(
            class = "view view-main",
            shiny::tags$div(
              class = "page",
              navbar,
              toolbar,
              shiny::tags$div(class = "page-content", ...)
            )
          )
        )
      ),
      deps = "framework7"
    )
  )
}



#' Navbar element
#'
#' Include in \link{f7_page}.
#'
#' @param title Navbar title
#' @export
f7_navbar <- function(title) {
  shiny::tags$div(
    class = "navbar",
    shiny::tags$div(class = "navbar-bg"),
    shiny::tags$div(
      class = "navbar-inner",
      shiny::tags$div(
        class = "title",
        title
      )
    )
  )
}


#' Toobar element
#'
#' Include in \link{f7_page}.
#'
#' @param ... Content.
#' @export
f7_toolbar <- function(...) {
  shiny::tags$div(
    class = "toolbar toolbar-bottom",
    shiny::tags$div(
      class = "toolbar-inner",
      ...
    )
  )
}
