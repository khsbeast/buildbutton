import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toc"
export default class extends Controller {
    goto({ params: { topic } }) {
        const topicSection = document.querySelector(`#${topic}`)
        window.scrollTo({
            top: topicSection.offsetTop - window.innerHeight / 4,
            behavior: "smooth"
        });
    }
}
