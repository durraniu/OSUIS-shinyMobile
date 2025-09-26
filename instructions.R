# Charpente site: https://github.com/RinteRface/charpente
# shinyMobile site: https://shinymobile.rinterface.com/
# shinyMobile github: https://github.com/RinteRface/shinyMobile

library(charpente)

# We need these dependencies
get_dependency_assets("framework7", tag = "5.7.14")
# $url
# [1] "https://cdn.jsdelivr.net/npm/framework7@5.7.14"
#
# $files
# $files$js
# $files$js$file
# [1] "/js/framework7.bundle.min.js"
#
# $files$js$guessed
# [1] TRUE
#
#
# $files$css
# $files$css$file
# [1] "/css/framework7.bundle.min.css"
#
# $files$css$guessed
# [1] TRUE

#-------------------------------------------------------
# Folder shinyMobile1: Sections 23.2 - 23.3----
#-------------------------------------------------------

## Create a new package using charpente
path <- file.path("D:", "shinyMobile")
create_charpente(path, license = "mit")

## We target the bundle files and download them:
## After downloading, see the:
### * inst/framework7-5.7.14 folder for css and js files
### * R/framework7-dependencies.R
create_dependency(
  "framework7",
  tag = "5.7.14",
  options = charpente_options(local = TRUE)
)


## Create Single Page layout
### Using html_2_R() and provided htmls
### Note that add_dependencies() function is created by charpente in R/ShinyMobile-utils
### Here's an example on framework7 page: https://framework7.io/docs/app-layout
### But the html_2_R() failed to convert the meta tags!


## Test with a simple app
## This app works BUT does not show "Test" because we failed to initialize the app
## Inspect the app in the browser
### devtools::document()
### devtools::load_all()
library(shiny)

ui <- f7_page(
  "Test",
  navbar = f7_navbar("Title"),
  toolbar = f7_toolbar(),
  title = "shinyMobile"
)

server <- function(input, output, session) {}
shinyApp(ui, server)




#-------------------------------------------------------
# Folder shinyMobile2: Section 23.4----
#-------------------------------------------------------

## See the srcjs/main.js, it needs init.js
## This function creates srcjs/init.js
charpente::create_js("init")

## Compress the js files
charpente::build_js()
# Warning: inst/shinyMobile-0.0.0.9000/dist folder created ...
# ✔ JavaScript successfully processed!
#   ✔ File R/shinyMobile-dependencies.R successfully created
# ✔ Dependencies successfully updated!
#   Warning message:
#   running command '"C:\Users\presage\AppData\Roaming\npm\npm.cmd" run build-prod' had status 1

### Fix the extra quotation marks in `main.js` in package.json,
### tried again but still got the status 1.
### Instead, ran these two in the terminal that worked
### i.e. created inst/shinyMobile-0.0.0.9000/dist (SEE THEM)
# npm install
# npm run build-prod


### Add the shinyMobile dependency in f7_page

## Test (successful: see the navbar, "Test" and toolbar)
devtools::document()
devtools::load_all()
library(shiny)

ui <- f7_page(
  "Test",
  navbar = f7_navbar("Title"),
  toolbar = f7_toolbar(),
  title = "shinyMobile"
)

server <- function(input, output, session) {}
shinyApp(ui, server)

### NOTE: I do not see shinyMobile-build in
### the Sources tab in inspector tools in Chrome!


## Now add notification part in init.js
# $( document ).ready(function() {
#
#   app = new Framework7({
#     // App root element
#     root: '#app',
#     // App Name
#     name: 'My App'
#   });
#
#   let mainView = app.views.create('.view-main');
#
#   let notification = app.notification.create({
#     text: 'Welcome to shinyMobile!',
#     on: {
#       opened: function () {
#         console.log('Notification opened');
#       }
#     }
#   }).open();
# });

charpente::build_js()
# Warning: inst/shinyMobile-0.0.0.9000/dist folder created ...
# ✔ JavaScript successfully processed!
#   ! Remove existing file R/shinyMobile-dependencies.R
# ✔ Dependencies successfully updated!


## Test (Success: I see the notification)
devtools::document()
devtools::load_all()
library(shiny)

ui <- f7_page(
  "Test",
  navbar = f7_navbar("Title"),
  toolbar = f7_toolbar(),
  title = "shinyMobile"
)

server <- function(input, output, session) {}
shinyApp(ui, server)




#-------------------------------------------------------
# Folder shinyMobile3: Section 23.5.1 to 23.5.3----
#-------------------------------------------------------

## Global theme
### Set a global theme in srcjs/init.js:
# $( document ).ready(function() {
#
#   let app_theme = 'auto'; // default
#
#   if (Framework7.device.desktop) {
#     app_theme = 'ios'; // force iOS look on desktop
#   }
#
#   app = new Framework7({
#     // App root element
#     root: '#app',
#     // App Name
#     name: 'My App',
#     // other options
#     theme: app_theme
#   });
#
#   let mainView = app.views.create('.view-main');
#
#   let notification = app.notification.create({
#     text: 'Welcome to shinyMobile!',
#     on: {
#       opened: function () {
#         console.log('Notification opened');
#       }
#     }
#   }).open();
#
#
#   if (app.device.desktop) {
#     console.log("It is a desktop device");
#   }
# });
charpente::build_js()
devtools::document()
devtools::load_all()
library(shiny)

ui <- f7_page(
  "Test",
  navbar = f7_navbar("Title"),
  toolbar = f7_toolbar(),
  title = "shinyMobile"
)

server <- function(input, output, session) {}
shinyApp(ui, server)








## Events
# $( document ).ready(function() {
#
#   let app_theme = 'auto'; // default
#
#   if (Framework7.device.desktop) {
#     app_theme = 'ios'; // force iOS look on desktop
#   }
#
#   app = new Framework7({
#     // App root element
#     root: '#app',
#     // App Name
#     name: 'My App',
#     // other options
#     theme: app_theme,
#
#     on: {
#       init: function () {
#         console.log('App initialized');
#       },
#       // other events
#       resize: function () {
#         console.log('App resized');
#       }
#     }
#   });
#
#   let mainView = app.views.create('.view-main');
#
#   let notification = app.notification.create({
#     text: 'Welcome to shinyMobile!',
#     on: {
#       opened: function () {
#         console.log('Notification opened');
#       }
#     }
#   }).open();
#
#
#   if (app.device.desktop) {
#     console.log("It is a desktop device");
#   }
# });

charpente::build_js()
devtools::document()
devtools::load_all()
library(shiny)

ui <- f7_page(
  "Test",
  navbar = f7_navbar("Title"),
  toolbar = f7_toolbar(),
  title = "shinyMobile"
)

server <- function(input, output, session) {}
shinyApp(ui, server)









## Components configuration
# $( document ).ready(function() {
#
#   let app_theme = 'auto'; // default
#
#   if (Framework7.device.desktop) {
#     app_theme = 'ios'; // force iOS look on desktop
#   }
#
#   app = new Framework7({
#     // App root element
#     root: '#app',
#     // App Name
#     name: 'My App',
#     // other options
#     theme: app_theme,
#
#     on: {
#       init: function () {
#         console.log('App initialized');
#       },
#       // other events
#       resize: function () {
#         console.log('App resized');
#       }
#     },
#
#     notification: {
#       title: 'NOTIFICATION TITLE',
#       closeTimeout: 3000,
#     }
#   });
#
#   let mainView = app.views.create('.view-main');
#
#   let notification = app.notification.create({
#     text: 'Welcome to shinyMobile!',
#     on: {
#       opened: function () {
#         console.log('Notification opened');
#       }
#     }
#   }).open();
#
#
#   let otherMessage = app.notification.create({
#     text: 'You look great!'
#   });
#
#   // equivalent to setTimeout ...
#   app.utils.nextTick(function() {
#     otherMessage.open();
#   }, 1000);
#
#
#   if (app.device.desktop) {
#     console.log("It is a desktop device");
#   }
# });

charpente::build_js()
devtools::document()
devtools::load_all()
library(shiny)

ui <- f7_page(
  "Test",
  navbar = f7_navbar("Title"),
  toolbar = f7_toolbar(),
  title = "shinyMobile"
)

server <- function(input, output, session) {}
shinyApp(ui, server)




#-------------------------------------------------------
# Folder shinyMobile4: Section 23.5.4 to 23.5.5, 23.6----
#-------------------------------------------------------

## Allow end-user configuration

### Add jsonlite
usethis::use_package("jsonlite")

### Modify init.js
# $( document ).ready(function() {
#
#   // NEW 1
#   let config = $(document).find('script[data-for="app"]');
#   config = JSON.parse(config.html());
#   config.root = '#app';
#
#
#   // NEW 1
#   app = new Framework7({
#     // App root element
#     root: '#app',
#     // App Name
#     name: 'My App',
#     version: config.version,
#     // other options
#     theme: config.theme,
#     notification: {
#       closeTimeout: 3000
#     }
#   });
#
#   let mainView = app.views.create('.view-main');
#
#   let notification = app.notification.create({
#     text: 'Welcome to shinyMobile!',
#     on: {
#       opened: function () {
#         console.log('Notification opened');
#       }
#     }
#   }).open();
#
# });



### Modify f7_page
### Add config
#' Mobile page wrapper
#'
#' @param ... Content.
#' @param navbar Slot for \link{f7_navbar}.
#' @param toolbar Slot for \link{f7_toolbar}.
#' @param title Tab title.
#' @param options Options for Framework7
#'
#' @export
f7_page <- function(..., navbar, toolbar, title = NULL,
                    options = NULL # NEW 1
) {

  # NEW 1 create config
  config_tag <- shiny::tags$script(
    type = "application/json",
    `data-for` = "app",
    jsonlite::toJSON(
      x = options,
      auto_unbox = TRUE,
      json_verbatim = TRUE
    )
  )

  # NEW 1 create body_tag
  body_tag <-
    # Body content (unchanged)
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
      ),
      # Config tag
      config_tag
    )


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
      # NEW 1
      body_tag,
      deps = c("framework7", "shinyMobile")
    )
  )
}

### Test NEW 1
charpente::build_js()
devtools::document()
devtools::load_all()
library(shiny)

ui <- f7_page(
  "Test",
  navbar = f7_navbar("Title"),
  toolbar = f7_toolbar(),
  title = "shinyMobile"
)

server <- function(input, output, session) {}
shinyApp(ui, server)
#### Weird looking app!


### Test again with options specified, uses Framework7 correctly!:
library(shiny)

ui <- f7_page(
  "Test",
  navbar = f7_navbar("Title"),
  toolbar = f7_toolbar(),
  title = "shinyMobile",
  options = list(version = 1, theme = "auto")
)

server <- function(input, output, session) {}
shinyApp(ui, server)




### NEW 2 Modifications
#### init.js:
# $( document ).ready(function() {
#
#   // NEW 1
#   let config = $(document).find('script[data-for="app"]');
#   config = JSON.parse(config.html());
#   config.root = '#app';
#
#
#   // NEW 2
#   app = new Framework7(config);
#
#   let mainView = app.views.create('.view-main');
#
#   let notification = app.notification.create({
#     text: 'Welcome to shinyMobile!',
#     on: {
#       opened: function () {
#         console.log('Notification opened');
#       }
#     }
#   }).open();
#
# });

#### f7_page
# NEW 2
shinyMobile_options <- list(
  theme = "auto",
  dark = TRUE,
  filled = FALSE,
  color = "#007aff",
  iosTranslucentBars = FALSE,
  navbar = list(
    iosCenterTitle = TRUE,
    hideOnPageScroll = TRUE
  ),
  toolbar = list(
    hideOnPageScroll = FALSE
  )
)

#' Mobile page wrapper
#'
#' @param ... Content.
#' @param navbar Slot for \link{f7_navbar}.
#' @param toolbar Slot for \link{f7_toolbar}.
#' @param title Tab title.
#' @param options Options for Framework7
#'
#' @export
f7_page <- function(..., navbar, toolbar, title = NULL,
                    options = shinyMobile_options # NEW 2
) {

  # NEW 1 create config
  config_tag <- shiny::tags$script(
    type = "application/json",
    `data-for` = "app",
    jsonlite::toJSON(
      x = options,
      auto_unbox = TRUE,
      json_verbatim = TRUE
    )
  )

  # NEW 1 create body_tag
  body_tag <-
    # Body content (unchanged)
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
      ),
      # Config tag
      config_tag
    )


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
      # NEW 1
      body_tag,
      deps = c("framework7", "shinyMobile")
    )
  )
}

#### Test NEW 2
charpente::build_js()
devtools::document()
devtools::load_all()
library(shiny)

ui <- f7_page(
  "Test",
  navbar = f7_navbar("Title"),
  toolbar = f7_toolbar(),
  title = "shinyMobile"
)

server <- function(input, output, session) {}
shinyApp(ui, server)

##### With different theme option
library(shiny)

ui <- f7_page(
  "Test",
  navbar = f7_navbar("Title"),
  toolbar = f7_toolbar(),
  title = "shinyMobile",
  options = list(theme = "ios")
)

server <- function(input, output, session) {}
shinyApp(ui, server)






## Modify configuration on the fly
### Run this app:
library(shiny)

ui <- f7_page(
  "Test",
  navbar = f7_navbar("Title"),
  toolbar = f7_toolbar(),
  title = "shinyMobile"
)

server <- function(input, output, session) {}
shinyApp(ui, server)

### In the browser console, run:
# app.utils.extend(app.params, {
#   notification: {
#     closeTimeout: 5000, // 5 seconds instead of default 3
#     closeOnClick: true
#   }
# });
#
# let newNotif = app.notification.create({
#   text: 'This notification uses the new defaults'
# }).open();




## Theming and Colours
### Approach 1: change f7_page
f7_page <- function(..., navbar, toolbar, title = NULL,
                    options = shinyMobile_options # NEW 2
) {

  # NEW 3 Body Colour
  body_cl <- NULL
  if (!is.null(options$color)) {
    body_cl <- sprintf("color-theme-%s", options$color)
  }

  # NEW 1 create config
  config_tag <- shiny::tags$script(
    type = "application/json",
    `data-for` = "app",
    jsonlite::toJSON(
      x = options,
      auto_unbox = TRUE,
      json_verbatim = TRUE
    )
  )

  # NEW 1 create body_tag
  body_tag <-
    # Body content (unchanged)
    shiny::tags$body(
      # NEW 3 Apply Colour
      class = body_cl,
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
      ),
      # Config tag
      config_tag
    )


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
      # NEW 1
      body_tag,
      deps = c("framework7", "shinyMobile")
    )
  )
}

#### Test:
devtools::document()
devtools::load_all()
library(shiny)

ui <- f7_page(
  "Test",
  navbar = f7_navbar("Title"),
  toolbar = f7_toolbar(tags$button(class="button", "Toolbar Button")),
  title = "shinyMobile",
  options = list(color = "red")
)

server <- function(input, output, session) {}
shinyApp(ui, server)




### Approach 2: HEX colours by changing init.js
#### Back to previous f7_page:
f7_page <- function(..., navbar, toolbar, title = NULL,
                    options = shinyMobile_options # NEW 2
) {

  # NEW 1 create config
  config_tag <- shiny::tags$script(
    type = "application/json",
    `data-for` = "app",
    jsonlite::toJSON(
      x = options,
      auto_unbox = TRUE,
      json_verbatim = TRUE
    )
  )

  # NEW 1 create body_tag
  body_tag <-
    # Body content (unchanged)
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
      ),
      # Config tag
      config_tag
    )


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
      # NEW 1
      body_tag,
      deps = c("framework7", "shinyMobile")
    )
  )
}

#### And init.js:
# $( document ).ready(function() {
#
#   // NEW 1
#   let config = $(document).find('script[data-for="app"]');
#   config = JSON.parse(config.html());
#   config.root = '#app';
#
#
#   // NEW 3
#   config.methods = {
#     toggleDarkTheme: function () {
#       let self = this;
#       let $html = self.$('html');
#       $html.toggleClass('theme-dark');
#     }
#   };
#   if (!config.hasOwnProperty('dark')) config.dark = false;
#
#   // NEW 2
#   app = new Framework7(config);
#
#   let mainView = app.views.create('.view-main');
#
#
#   // NEW 3
#   if (config.hasOwnProperty('color')) {
#     let colorCSS = app.utils.colorThemeCSSProperties(config.color);
#     $('<style>')
#     .prop('type', 'text/css')
#     .html(`:root {
#       --f7-theme-color:${colorCSS['--f7-theme-color']};
#       --f7-theme-color-rgb:${colorCSS['--f7-theme-color-rgb']};
#       --f7-theme-color-shade:${colorCSS['--f7-theme-color-shade']};
#       --f7-theme-color-tint:${colorCSS['--f7-theme-color-tint']};
#     }`)
#     .appendTo('head');
#   }
#
#   // NEW 3
#   if (!config.hasOwnProperty('filled')) config.filled = false;
#
#   if (config.filled) {
#     let filledCSS = `
#     :root,
#     :root.theme-dark,
#     :root .theme-dark {
#       --f7-bars-bg-color: var(--f7-theme-color);
#       --f7-bars-bg-color-rgb: var(--f7-theme-color-rgb);
#       --f7-bars-translucent-opacity: 0.9;
#       --f7-bars-text-color: #fff;
#         --f7-bars-link-color: #fff;
#         --f7-navbar-subtitle-text-color: rgba(255,255,255,0.85);
#       --f7-bars-border-color: transparent;
#       --f7-tabbar-link-active-color: #fff;
#         --f7-tabbar-link-inactive-color: rgba(255,255,255,0.54);
#       --f7-sheet-border-color: transparent;
#       --f7-tabbar-link-active-border-color: #fff;
#     }
#     .appbar,
#     .navbar,
#     .toolbar,
#     .subnavbar,
#     .calendar-header,
#     .calendar-footer {
#       --f7-touch-ripple-color: var(--f7-touch-ripple-white);
#       --f7-link-highlight-color: var(--f7-link-highlight-white);
#       --f7-button-text-color: #fff;
#         --f7-button-pressed-bg-color: rgba(255,255,255,0.1);
#     }
#     .navbar-large-transparent,
#     .navbar-large.navbar-transparent {
#       --f7-navbar-large-title-text-color: #000;
#
#         --r: 0;
#       --g: 122;
#       --b: 255;
#       --progress: var(--f7-navbar-large-collapse-progress);
#       --f7-bars-link-color: rgb(
#         calc(var(--r) + (255 - var(--r)) * var(--progress)),
#         calc(var(--g) + (255 - var(--g)) * var(--progress)),
#         calc(var(--b) + (255 - var(--b)) * var(--progress))
#       );
#     }
#     .theme-dark .navbar-large-transparent,
#     .theme-dark .navbar-large.navbar-transparent {
#       --f7-navbar-large-title-text-color: #fff;
#     }`;
#
#     $('<style>')
#     .prop('type', 'text/css')
#     .html(`${filledCSS}`)
#     .appendTo('head');
#   }
#
#
#   // NEW 3
#   if (config.dark) {
#     app.methods.toggleDarkTheme();
#   }
#
#
#   let notification = app.notification.create({
#     text: 'Welcome to shinyMobile!',
#     on: {
#       opened: function () {
#         console.log('Notification opened');
#       }
#     }
#   }).open();
#
# });




#### Test:
charpente::build_js()
devtools::document()
devtools::load_all()
library(shiny)

ui <- f7_page(
  "Test",
  navbar = f7_navbar("Title"),
  toolbar = f7_toolbar(),
  title = "shinyMobile",
  options = list(filled = TRUE, color = "#FF0000", dark = FALSE)
)

server <- function(input, output, session) {}
shinyApp(ui, server)






#-------------------------------------------------------
# Folder shinyMobile5: Chapter 24----
#-------------------------------------------------------

# Run the current app in Chrome and check the:
# * Application tab
# * Google lighthouse audit report
devtools::load_all()
library(shiny)

ui <- f7_page(
  "Test",
  navbar = f7_navbar("Title"),
  toolbar = f7_toolbar(),
  title = "shinyMobile",
  options = list(filled = TRUE, color = "#FF0000", dark = FALSE)
)

server <- function(input, output, session) {}
shinyApp(ui, server, options = list(port = 4449))

## NOTE: Lighthouse does not show PWA option





# Create inst/examples/pwa-app and add app.R
# Now run:
devtools::load_all()
charpente::set_pwa("inst/examples/pwa-app", register_service_worker = TRUE)
# ✔ Web manifest successfully created!
#   ℹ Trying with https://data.jsdelivr.com/v1/package/npm/pwacompat
# ✔ Success!
#   ───────────────────────────────────────────────────────────────────────
# ✔ Directory inst/pwacompat-2.0.17/js successfully created
# ✔ File R/pwa-dependencies.R successfully created
# • Don't forget to update the dependencies in add_dependencies!
# ✔ pwa-utils successfully copied to /www!
# ✔ File created at D:/shinyMobile/shinyMobile5/srcjs/sw-register.js
# ✔ File automatically linked in `golem_add_external_resources()`.
# ✔ Script successfuly added to JS entry point!
# ✔ Script successfuly added to JS entry point!

## NOTE: See the www folder in inst/examples/pwa-app



# Shortcuts in inst/examples/pwa-app/www/manifest.webmanifest
devtools::load_all()
shiny::runApp("inst/examples/pwa-app", port = 5995)
## Change the URL to: http://127.0.0.1:5995/?foo=1



# Update R/pwacompat-dependencies.R
## It was already created with charpente::set_pwa, but doing
## local = FALSE uses CDN
charpente::create_dependency("pwacompat", options = charpente::charpente_options(local = FALSE))

# Update f7_page:
# add_dependencies(
#   body_tag,
#   deps = c("framework7", "shinyMobile", "pwa", "pwacompat")
# )
devtools::load_all()
shiny::runApp("inst/examples/pwa-app", port = 5995)
## NOTE: the favicon is changed and check the deps showing up in head in inspector tools


# Service worker
# Follow the instructions in the chapter and in srcjs/init.js, add and build:
# config.serviceWorker = {
#   path: window.location.pathname + 'service-worker.js',
#   scope: window.location.pathname
# };
charpente::build_js()
devtools::load_all()
shiny::runApp("inst/examples/pwa-app", port = 5995)
## NOTE: See the service worker section in Application in Chrome
## Try making it offline




# Disable PWA for the end user
## Add this to f7_page
body_tag <- tags$body(
  `data-pwa` = tolower(allowPWA),
  tags$div(
    id = "app",
    # ... unchanged
  )
)
## And add to srcjs/init.js
# // check if the app is intended to be a PWA
# let isPWA = $('body').attr('data-pwa') === 'true';
#
# if (isPWA) {
#   config.serviceWorker = {
#     path: window.location.pathname + 'service-worker.js',
#     scope: window.location.pathname
#   };
# }
charpente::build_js()
devtools::load_all()
shiny::runApp("inst/examples/pwa-app", port = 5995)





library(shiny)
library(OSUICode)

ui <- f7_page(
  navbar = f7_navbar("PWA App"),
  toolbar = f7_toolbar(),
  title = "shinyMobile"
)

server <- function(input, output, session) {
  session$allowReconnect("force")
}

shinyApp(ui, server)
