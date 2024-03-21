import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect(){
    console.log("Hello STIMULUS!", this.element)
  }
  static targets = ["modal"]

  closeModal() {
    this.element.parentElement.removeAttribute("src")
    this.element.remove()
  }

  submitEnd(e) {
    if (e.detail.success) {
      this.closeModal()
    }
  }

  closeWithEscape(e) {
    if (e.key == "Escape"){
      this.closeModal()
    }
  }

  closeWithBackgroundClick(e) {
    if (e && e.target.id === 'modal-overlay') {
      this.closeModal()
    }
  }
}
