import { Modal } from "tailwindcss-stimulus-components"

// Connects to data-controller="subscribe-modal"
export default class SubscribeModal extends Modal {

    connect() {
        super.connect();

        if (this.data.get('showOnLoad') && this.data.get('showOnLoad') === 'true') {
            // Lock the scroll and save current scroll position
            this.lockScroll();

            // Unhide the modal
            this.containerTarget.classList.remove(this.toggleClass);

            // Insert the background
            if (!this.data.get("disable-backdrop")) {
                document.body.insertAdjacentHTML('beforeend', this.backgroundHtml);
                this.background = document.querySelector(`#${this.backgroundId}`);
            }
        }
    }

    lockScroll() {
        super.lockScroll();
        // to fix layout and scrolling issue when modal is open
        document.body.classList.remove('fixed');
    }

}
