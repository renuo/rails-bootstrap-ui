window.alert = (message) => {
  const modal = document.querySelector('#turbo-alert-modal');
  modal.querySelector('.modal-body').innerText = message;

  const bootstrapModal = bootstrap.Modal.getOrCreateInstance(modal);
  bootstrapModal.show();
};

// window.confirm is also possible but only takes "message" as argument
Turbo.setConfirmMethod((message, _element, submitter) => {
  const modal = document.querySelector('#turbo-confirm-modal');
  const modalTitle = modal.querySelector('.modal-title');
  const modalBody = modal.querySelector('.modal-body');
  const confirmButton = modal.querySelector('#confirm-button');

  modalTitle.innerText = submitter.dataset.turboConfirmTitle || modalTitle.dataset.defaultText;
  modalBody.innerText = message;
  const bootstrapModal = bootstrap.Modal.getOrCreateInstance(modal);
  bootstrapModal.show();

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
