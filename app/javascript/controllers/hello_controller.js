import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}

// app/javascript/application.js

// Example of unused variable
// const unusedVar = 42;

// Example of missing semicolon
console.log('Hello, world')

// Example of console statement (if using Airbnb style guide)
console.log('This is a test');

