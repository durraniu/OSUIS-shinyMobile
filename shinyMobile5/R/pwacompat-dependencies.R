#' pwacompat dependencies utils
#'
#' @description This function attaches pwacompat. dependencies to the given tag
#'
#' @param tag Element to attach the dependencies.
#'
#' @importFrom htmltools tagList htmlDependency
#' @export
add_pwacompat_deps <- function(tag) {
 pwacompat_deps <- htmlDependency(
  name = "pwacompat",
  version = "2.0.17",
  src = c(href = "https://cdn.jsdelivr.net/npm/pwacompat@2.0.17"),
  script = "pwacompat.min.js",
 )
 tagList(tag, pwacompat_deps)
}

