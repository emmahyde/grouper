import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// import { AutoSubmitFormController } from "stimulus-library"
// application.register("auto-submit-form", AutoSubmitFormController)

// this is where the `data-controller` value comes from, i.e. 'dashboard'
// application.register("dashboard", DashboardController)

export { application }

