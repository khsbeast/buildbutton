import { Modal } from "tailwindcss-stimulus-components"

// Connects to data-controller="subscribe-modal"
export default class SubscribeModal extends Modal {

    lockScroll() {
        super.lockScroll();
        // to fix layout and scrolling issue when modal is open
        document.body.classList.remove('fixed');
    }

}
