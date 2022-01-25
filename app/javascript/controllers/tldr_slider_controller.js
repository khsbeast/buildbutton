import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tldr-slider"
export default class extends Controller {
    static targets = [ "track", "indicator", "navigator", "back", "next"];

    static values = {
        count: Number
    }

    initialize() {
        this.index = 0;
        this.showCurrentSlide();
    }

    back() {
        if(this.index > 0){
            this.index--;
            this.showCurrentSlide();
        }
    }

    next() {
        if(this.index < this.countValue - 1){
            this.index++;
            this.showCurrentSlide();
        }
        
    }

    move({params: {id}}){
        this.index = id;
        this.showCurrentSlide();        
    }

    showCurrentSlide() {
        this.trackTarget.style = `transform: translateX(${this.index * -100}%);`;
        this.indicatorTarget.innerText = `${this.index+1}/${this.countValue}`;
        this.navigatorTargets.forEach((element, index) => {
            if (index === this.index){
                element.className = "active";
            }
            else{
                element.className = "";
            }
        });
        if(this.index === 0){
            this.backTarget.classList.add("disabled");
        }else{
            this.backTarget.classList.remove("disabled");
        }
        if(this.index === this.countValue - 1){
            this.nextTarget.classList.add("disabled");
        }else{
            this.nextTarget.classList.remove("disabled");
        }
    }
}
