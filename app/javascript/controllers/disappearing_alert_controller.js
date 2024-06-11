import {Controller} from '@hotwired/stimulus';

export default class extends Controller {
    static targets = ['alert', 'alertTemplate'];

    connect() {
        this.bsAlert = bootstrap.Alert.getOrCreateInstance(this.element);
    }

    liveAlert() {
        const alertPlaceholder = this.alertTarget;
        const appendAlert = () => {
            const wrapper = document.createElement('div');
            wrapper.innerHTML = [
                `<div class="alert alert-info alert-dismissible fade show" 
              role="alert"
              data-controller='disappearing-alert'
              data-action='animationend->disappearing-alert#dismissAlert'>`,
                `   <div>Live Alert</div>`,
                '   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>',
                '</div>'
            ].join('');
            alertPlaceholder.append(wrapper);
        };
        appendAlert();
    }

    dismissAlert() {
        this.bsAlert.close();
    }
}
