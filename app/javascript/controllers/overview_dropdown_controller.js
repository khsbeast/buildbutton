import { Dropdown } from "tailwindcss-stimulus-components"

// Connects to data-controller="overview-dropdown"
export default class OverviewDropdown extends Dropdown {
    static targets = ["currentIndex"];

    initialize() {
        this.topics = document.querySelectorAll('.topic');
        const topicObserver = new IntersectionObserver((entries) => this.onIntersect(entries, this.currentIndexTarget), {
            rootMargin: `-${window.innerHeight / 3}px 0px`,
        });
        this.topics.forEach(topic => {
            topicObserver.observe(topic);
        });
    }

    onIntersect(entries, currentIndexTarget) {
        if (entries[0].isIntersecting) {
            currentIndexTarget.innerText = entries[0].target.firstElementChild.innerText;
        }
    }

}