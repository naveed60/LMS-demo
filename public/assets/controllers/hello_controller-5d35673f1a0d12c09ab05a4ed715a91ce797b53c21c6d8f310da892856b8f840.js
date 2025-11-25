import { Controller } from "@hotwired/stimulus"
// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>



export default class extends Controller {
  static targets = [ "output" ]

  connect() {
  
    this.outputTarget.textContent = 'Hello, Stimulus!'
  }

}
{
  const application = Stimulus.Application.start();
application.register("output", output);
};
