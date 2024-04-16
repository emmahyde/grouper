import "@hotwired/turbo-rails"
// ~ points to app/client, in theory
import "~/controllers"
// Import a stylesheet in app/client/application
// note, i KNOW this is possible, you can actually do this INSTEAD
// of using the <%= vite_stylesheet_tag %>, which i discovered when
// using that made me want to die
import "@assets/stylesheets/application.css"
import { Application } from "@hotwired/stimulus"

console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

// Import all channels. (i tried to use this and globEager wasn't working for me - EH)
// const channels = import.meta.globEager('./**/*_channel.js')

// these used to be over at javascripts/application.js, basically same thing
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

