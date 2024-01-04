import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["name", "output"]

  connect() {
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
