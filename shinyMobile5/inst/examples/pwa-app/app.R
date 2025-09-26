library(shiny)
library(shinyMobile)

ui <- f7_page(
  navbar = f7_navbar("PWA App"),
  toolbar = f7_toolbar(),
  title = "shinyMobile"#,
  # allowPWA = FALSE
)

server <- function(input, output, session) {
  observeEvent(session$clientData$url_search, {
    query <- parseQueryString(session$clientData$url_search)
    if (!is.null(query$foo) && query$foo == "1") {
      print("foo = 1")
    }
  })
}

shinyApp(ui, server)
