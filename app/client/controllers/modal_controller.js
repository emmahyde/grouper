import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal"]

  connect(){
    const form = this.modalTarget.querySelector("form")
    this.initialState = this.serializeForm(form)
  }

  closeModal() {
    const form = this.modalTarget.querySelector("form")
    const currentFormState = this.serializeForm(form)
    if (this.initialState !== currentFormState){
      const confirmDiscard =  confirm("Are you sure you want to discard your changes?")
      if (!confirmDiscard){
        return
      }
    }
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

  serializeForm(formElement){
    return new URLSearchParams(new FormData(formElement)).toString()
  }
}
