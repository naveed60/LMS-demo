import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="click"
export default class extends Controller {
   static targets =["output"]
   static values  ={ number  : Number } 
  connect() {
    this.numberValueChanged()
  }
  clicked(){
    this.numberValue++
  }
  numberValueChanged(){
    debugger
    this.outputTarget.textContent = objects.length
  }
};
