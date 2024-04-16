// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "@assets/stylesheets/application.css"
import "~/controllers"
// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'
import { Application } from "@hotwired/stimulus"
// Example: Load Rails libraries in Vite.
//
// import * as Turbo from "@hotwired/turbo"
// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log('Vite ⚡️ Rails')

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// import { AutoSubmitFormController } from "stimulus-library"
// application.register("auto-submit-form", AutoSubmitFormController)

// this is where the `data-controller` value comes from, i.e. 'dashboard'
// application.register("friendships", FriendshipsController)

export { application }

