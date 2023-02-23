import { Application } from "@hotwired/stimulus"
"//= require hotwire"
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

import "controllers";
