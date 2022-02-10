import { Controller } from "@hotwired/stimulus"
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";


// Connects to data-controller="nutshell"
export default class extends Controller {
  static targets = ["nuthshellOverviewBox","blogSection","articleNutshell","nutshellMainBox"]
  connect() {
    if(window.screen.availWidth > 1280){
      ScrollTrigger.create({
          trigger: this.articleNutshellTarget,
          scrub: true,
          end: 'bottom 0%',
          start: 'bottom 0%',
          onEnter: () => {    
          this.nuthshellOverviewBoxTarget.classList.remove('hidden')  
          const fade = gsap.fromTo(this.nuthshellOverviewBoxTarget,{opacity:0,scale:0},{duration:1.5, opacity:1, scale:1,ease:"power3"})
          const moveup = gsap.to(this.blogSectionTarget,{duration:1.5,y:"0%",ease:"power3"})
          },
          onLeaveBack: () => {
            const fade = gsap.fromTo(this.nuthshellOverviewBoxTarget,{opacity:1,scale:1},{duration:1.5, opacity:0, scale:0,ease:"power3"})
            const moveup = gsap.to(this.blogSectionTarget,{duration:1.5,y:"-80%",ease:"power3"})  
          }
      })
    }
  }
  scrollToNutshell(){
    this.nutshellMainBoxTarget.scrollIntoView({
        behavior: 'smooth'
      });
  }

  }
