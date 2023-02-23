import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="click"
export default class extends Controller {
   static targets =["input", "output"]
   
  connect() {
   
  }
  changed(){
    this.outputTarget.textContent=this.inputTarget.value
  }
}