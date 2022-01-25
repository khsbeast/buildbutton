import { Application } from "@hotwired/stimulus"

const application = Application.start()

import { Modal, Dropdown } from "tailwindcss-stimulus-components"
application.register('modal', Modal)
application.register('dropdown', Dropdown)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
