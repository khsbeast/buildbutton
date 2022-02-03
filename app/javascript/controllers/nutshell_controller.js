import { Controller } from "@hotwired/stimulus"
import { gsap } from "gsap";
import {Flip } from 'gsap/Flip'
import { ScrollTrigger } from "gsap/ScrollTrigger";


// Connects to data-controller="nutshell"
export default class extends Controller {
  static targets = ["button","heading"]
  connect() {
    console.log(butt)
    console.log("oncsse")
  }
  anim()
  {
    gsap.registerPlugin(Flip);

    const state2 = Flip.getState(".text1")
    const state = Flip.getState(".heading")
    const state3 = Flip.getState(".box1")

      const butt = document.querySelector('.button')
      const head = document.querySelector('.heading')
  
      const head1 = document.querySelector('.text1')
      const head2 = document.querySelector('.text2')
  
      const box1 = document.querySelector('.box1')
      const box2 = document.querySelector('.box2')
      
      head.classList.add('hidden')
      butt.classList.remove('hidden')
  
      head1.classList.add('hidden')
      head2.classList.remove('hidden')
  
      box1.classList.add('hidden')
      box2.classList.remove('hidden')

      const nut = Flip.from(state,{
        targets:butt,
        duration:0.5,
        ease:"power1",
      })
      const text = Flip.from(state2,{
        targets:head2,
        duration:0.5,
        ease:"power1",
      })

      const box = Flip.from(state3,{
        targets:box2,
        duration:0,
        ease:"power1",
        fade:true,
        absolute:true
      })
  }
  }
