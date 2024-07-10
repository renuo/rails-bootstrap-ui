window.alert = (message) => {
  const modal = document.querySelector('#turbo-alert-modal');
  modal.querySelector('.modal-body').innerText = message;

  const bootstrapModal = bootstrap.Modal.getOrCreateInstance(modal);
  bootstrapModal.show();
};

// window.confirm is also possible but only takes "message" as argument
Turbo.setConfirmMethod((message, _element, submitter) => {
  const modal = document.querySelector('#turbo-confirm-modal');
  modal.querySelector('.modal-body').innerText = message;

  const bootstrapModal = bootstrap.Modal.getOrCreateInstance(modal);
  bootstrapModal.show();
  const confirmButton = modal.querySelector('#confirm-button');

  return new Promise((resolve) => {
    const confirm = () => {
      resolve(true);
      bootstrapModal.hide();
    };

    confirmButton.addEventListener('click', confirm, { once: true });
    modal.addEventListener('hide.bs.modal', () => {
      resolve(false);
      confirmButton.removeEventListener('click', confirm);
    }, { once: true });
  });
});
