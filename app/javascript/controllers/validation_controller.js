import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="validation"
export default class extends Controller {
  static targets = [ "fields", "errorMessage" ];

  send(event){
    event.preventDefault()

    fetch("/verify_username", {
      method: "POST",
      headers: {"Accept": "application/json", "X-CSRF-Token": this.#getMetaValue("csrf-token") },
      body: new FormData(this.fieldsTarget)
    })
    .then(response => response.json())
    .then((data) => {
      this.errorMessageTarget.innerHTML = ""
      this.errorMessageTarget.insertAdjacentHTML('beforeend', data.message)
    })
  }


  #getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }

  connect() {

  }
}
