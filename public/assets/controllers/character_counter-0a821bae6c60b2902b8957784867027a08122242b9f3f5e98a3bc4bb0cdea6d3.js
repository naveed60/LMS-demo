import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["count", "input"];

  connect(){
    
  }
  update() {
    const count = this.inputTarget.value.length;
    this.countTarget.textContent = count;
  }
};
