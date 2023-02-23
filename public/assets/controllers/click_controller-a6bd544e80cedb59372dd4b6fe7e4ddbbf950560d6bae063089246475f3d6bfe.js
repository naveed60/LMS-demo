import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="click"
export default class extends Controller {
   static targets =["output"]
   static values  ={ number  : Number } 
  connect() {
    debugger
    this.numberValueChanged()
  }
  clicked(){
    this.numberValue++
  }
  numberValueChanged(){
    this.outputTarget.textContent = document.querySelector('table').dataset.count
  }
};
