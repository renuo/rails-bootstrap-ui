import { Application } from '@hotwired/stimulus';

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

/* eslint-disable import/prefer-default-export */
export { application };
/* eslint-enable import/prefer-default-export */
