import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="location-form"
export default class extends Controller {
  connect() {
    console.log(this.element);
  }
}
