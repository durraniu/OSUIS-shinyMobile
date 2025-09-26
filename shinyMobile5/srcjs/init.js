$( document ).ready(function() {

  // NEW 1
  let config = $(document).find('script[data-for="app"]');
  config = JSON.parse(config.html());
  config.root = '#app';


  // NEW 3
  config.methods = {
    toggleDarkTheme: function () {
      let self = this;
      let $html = self.$('html');
      $html.toggleClass('theme-dark');
    }
  };
  if (!config.hasOwnProperty('dark')) config.dark = false;

  // NEW 2
  app = new Framework7(config);

  let mainView = app.views.create('.view-main');


  // NEW 3
  if (config.hasOwnProperty('color')) {
    let colorCSS = app.utils.colorThemeCSSProperties(config.color);
    $('<style>')
    .prop('type', 'text/css')
    .html(`:root {
      --f7-theme-color:${colorCSS['--f7-theme-color']};
      --f7-theme-color-rgb:${colorCSS['--f7-theme-color-rgb']};
      --f7-theme-color-shade:${colorCSS['--f7-theme-color-shade']};
      --f7-theme-color-tint:${colorCSS['--f7-theme-color-tint']};
    }`)
    .appendTo('head');
  }

  // NEW 3
  if (!config.hasOwnProperty('filled')) config.filled = false;

  if (config.filled) {
    let filledCSS = `
    :root,
    :root.theme-dark,
    :root .theme-dark {
      --f7-bars-bg-color: var(--f7-theme-color);
      --f7-bars-bg-color-rgb: var(--f7-theme-color-rgb);
      --f7-bars-translucent-opacity: 0.9;
      --f7-bars-text-color: #fff;
        --f7-bars-link-color: #fff;
        --f7-navbar-subtitle-text-color: rgba(255,255,255,0.85);
      --f7-bars-border-color: transparent;
      --f7-tabbar-link-active-color: #fff;
        --f7-tabbar-link-inactive-color: rgba(255,255,255,0.54);
      --f7-sheet-border-color: transparent;
      --f7-tabbar-link-active-border-color: #fff;
    }
    .appbar,
    .navbar,
    .toolbar,
    .subnavbar,
    .calendar-header,
    .calendar-footer {
      --f7-touch-ripple-color: var(--f7-touch-ripple-white);
      --f7-link-highlight-color: var(--f7-link-highlight-white);
      --f7-button-text-color: #fff;
        --f7-button-pressed-bg-color: rgba(255,255,255,0.1);
    }
    .navbar-large-transparent,
    .navbar-large.navbar-transparent {
      --f7-navbar-large-title-text-color: #000;

        --r: 0;
      --g: 122;
      --b: 255;
      --progress: var(--f7-navbar-large-collapse-progress);
      --f7-bars-link-color: rgb(
        calc(var(--r) + (255 - var(--r)) * var(--progress)),
        calc(var(--g) + (255 - var(--g)) * var(--progress)),
        calc(var(--b) + (255 - var(--b)) * var(--progress))
      );
    }
    .theme-dark .navbar-large-transparent,
    .theme-dark .navbar-large.navbar-transparent {
      --f7-navbar-large-title-text-color: #fff;
    }`;

    $('<style>')
    .prop('type', 'text/css')
    .html(`${filledCSS}`)
    .appendTo('head');
  }


  // NEW 3
  if (config.dark) {
    app.methods.toggleDarkTheme();
  }

  // NEW 4
  // check if the app is intended to be a PWA
  let isPWA = $('body').attr('data-pwa') === 'true';

  if (isPWA) {
    config.serviceWorker = {
      path: window.location.pathname + 'service-worker.js',
      scope: window.location.pathname
    };
  }





  let notification = app.notification.create({
    text: 'Welcome to shinyMobile!',
    on: {
      opened: function () {
        console.log('Notification opened');
      }
    }
  }).open();

});


