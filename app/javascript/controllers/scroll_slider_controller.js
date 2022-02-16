import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-slider"
export default class extends Controller {
    static targets = ["track", "back", "next"];

    static values = {
        slide: Number
    }

    disableClasses = ['cursor-not-allowed', 'opacity-30'];

    connect() {
        if (this.trackTarget.scrollWidth <= this.trackTarget.clientWidth) {
            this.nextTarget.classList.remove('md:flex');
            this.backTarget.classList.remove('md:flex');
        }
        else {
            this.backTarget.classList.add(...this.disableClasses);
        }
        this.trackTarget.addEventListener('scroll', this.updateScrollButtons.bind(this));
    }

    disconnect() {
        this.trackTarget.removeEventListener('scroll', this.updateScrollButtons.bind(this));
    }

    scroll({ params: { direction } }) {
        this.trackTarget.scrollTo({
            left: direction === 'back' ?
                this.trackTarget.scrollLeft - this.slideValue :
                this.trackTarget.scrollLeft + this.slideValue,
            behavior: "smooth"
        });
    }

    updateScrollButtons() {
        if (this.trackTarget.scrollLeft === 0) {
            this.backTarget.classList.add(...this.disableClasses);
        }
        else {
            this.backTarget.classList.remove(...this.disableClasses);
        }
        if (this.trackTarget.scrollLeft === this.trackTarget.scrollWidth - this.trackTarget.clientWidth) {
            this.nextTarget.classList.add(...this.disableClasses);
        }
        else {
            this.nextTarget.classList.remove(...this.disableClasses);
        }
    }
}