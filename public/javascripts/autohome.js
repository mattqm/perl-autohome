/* my-app.js */

// First of all, we need to initialize/enable Framework7 Vue plugin:
// We need to pass Framework7Vue plugin to Framework7's .use() method
Framework7.use(Framework7Vue);

// Init Vue App
new Vue({
  // App Root Element
  el: '#app',

  // App root data
  data() {
    return {
      // Framework7 parameters that we pass to <f7-app> component
      f7params: {
        // Array with app routes
        routes: [],
        // App Name
        name: 'My App',
        // App id
        id: 'com.myapp.test',
        // ...
      }
    };
  },
  // App root methods
  methods: {
    // ....
  }
})
