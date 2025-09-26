$( document ).ready(function() {

  let app_theme = 'auto'; // default

  if (Framework7.device.desktop) {
    app_theme = 'ios'; // force iOS look on desktop
  }

  app = new Framework7({
    // App root element
    root: '#app',
    // App Name
    name: 'My App',
    // other options
    theme: app_theme,

    on: {
      init: function () {
        console.log('App initialized');
      },
      // other events
      resize: function () {
        console.log('App resized');
      }
    },

    notification: {
      title: 'NOTIFICATION TITLE',
      closeTimeout: 3000,
    }
  });

  let mainView = app.views.create('.view-main');

  let notification = app.notification.create({
    text: 'Welcome to shinyMobile!',
    on: {
      opened: function () {
        console.log('Notification opened');
      }
    }
  }).open();


  let otherMessage = app.notification.create({
    text: 'You look great!'
  });

  // equivalent to setTimeout ...
  app.utils.nextTick(function() {
    otherMessage.open();
  }, 1000);


  if (app.device.desktop) {
    console.log("It is a desktop device");
  }
});
