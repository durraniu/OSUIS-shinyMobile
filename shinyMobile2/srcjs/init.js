$( document ).ready(function() {

  app = new Framework7({
    // App root element
    root: '#app',
    // App Name
    name: 'My App'
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
});


