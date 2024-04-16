import { Application } from "@hotwired/stimulus"
import { registerControllers } from "stimulus-vite-helpers"

// these used to be over at javascripts/application.js, basically same thing
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

const controllers  = import.meta.globEager('./*_controller.js')

registerControllers(application, controllers)

export { application }
