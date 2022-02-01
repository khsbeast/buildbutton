import { Controller } from "@hotwired/stimulus";
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

// Connects to data-controller="overview"
export default class extends Controller {

    static targets = ['index', 'mobileIndex', "mobileProgressBar"];
    static values = {
        singleProgressBar: Boolean
    }

    connect() {
        this.removeElementIfNotNeeded();

        let header;
        if (window.innerWidth < 769) {
            header = document.querySelector('.header-mobile');
        }
        else {
            header = document.querySelector('.header');
        }
        // header transition
        const headerTwin = gsap.to(header, {
            opacity: 1,
        });
        const scrollDown = document.querySelector('#scroll-down');
        ScrollTrigger.create({
            animation: headerTwin,
            trigger: '.hero-banner',
            scrub: true,
            start: 'bottom 40%',
            end: 'bottom 0',
            onEnter: () => {
                scrollDown.classList.remove('animate-bounce');
            },
            onLeaveBack: () => {
                scrollDown.classList.add('animate-bounce');
            },
        });

        // progress bar transition
        this.topics = document.querySelectorAll('.topic');
        this.triggers = Array.from(this.topics).map(topic =>
            ScrollTrigger.create({
                trigger: topic,
                scrub: true,
                end: () => `bottom ${window.innerHeight / 4}`,
                start: () => `top ${window.innerHeight / 4}`,
                onEnter: this.startProgress.bind(this),
                onEnterBack: this.startProgress.bind(this),
                onLeave: this.endProgress.bind(this),
                onLeaveBack: this.endProgress.bind(this),
                onUpdate: this.updateProgress.bind(this)
            })
        );
    }

    startProgress(self) {
        if (this.hasMobileIndexTarget) {
            this.mobileIndexTarget.innerText = self.trigger.firstElementChild.innerText;
        }
        else if (this.hasIndexTarget) {
            const indexTarget = this.indexTargets.find(index =>
                index.getAttribute('data-overview-topic-param') === self.trigger.getAttribute('id')
            );
            if (indexTarget) {
                indexTarget.classList.add('text-textBlack');
            }
        }
    }

    updateProgress(self) {
        if (this.hasMobileProgressBarTarget) {
            this.mobileProgressBarTarget.style.width = `${self.progress * 100}%`;
        }
        else {
            this.indexTargets.forEach(index => {
                if (index.getAttribute('data-overview-topic-param') === self.trigger.getAttribute('id')) {
                    index.style.width = `${self.progress * 100}%`;
                }
            });
        }
    }

    endProgress(self) {
        if (!this.hasMobileIndexTarget) {
            const indexTarget = this.indexTargets.find(index =>
                index.getAttribute('data-overview-topic-param') === self.trigger.getAttribute('id')
            );
            if (indexTarget) {
                indexTarget.style.width = '0px';
                indexTarget.classList.remove('text-textBlack');
            }
        }
    }

    disconnect() {
        this.triggers.forEach(trigger => trigger.kill());
    }

    removeElementIfNotNeeded() {
        // remove mobile element for desktop view
        if (this.hasMobileProgressBarTarget && window.innerWidth > 768) {
            this.element.remove();
        }
        // remove desktop element for mobile view
        else if (!this.hasMobileProgressBarTarget && window.innerWidth < 768) {
            this.element.remove();
        }
    }

    goto({ params: { topic } }) {
        const topicSection = document.querySelector(`#${topic}`)
        window.scrollTo({
            top: (topicSection.offsetTop - window.innerHeight / 4) + 2,
            behavior: "smooth"
        });
    }
}
