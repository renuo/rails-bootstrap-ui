import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ["card"];

  connect() {
    this.cardTargets.forEach(card => {
      card.addEventListener('mouseenter', this.handleMouseEnter.bind(this));
      card.addEventListener('mouseleave', this.handleMouseLeave.bind(this));
    });
  }

  handleMouseEnter(event) {
    const card = event.currentTarget;
    const rect = card.getBoundingClientRect();
    const x = event.clientX - rect.left;
    const y = event.clientY - rect.top;

    const centerX = rect.width / 2;
    const centerY = rect.height / 2;

    const rotateX = (y - centerY) / centerY * -10;
    const rotateY = (x - centerX) / centerX * 10;

    card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg)`;
  }

  handleMouseLeave(event) {
    const card = event.currentTarget;
    card.style.transform = 'perspective(1000px) rotateX(0) rotateY(0)';
  }
}

