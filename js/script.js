
const openPopupBtn = document.querySelector('.abrir-popup-button');
const closePopupBtn = document.querySelector('.fechar-popup-button');
const popup = document.getElementById('popup');


openPopupBtn.addEventListener('click', () => {
    popup.classList.add('mostrar');
});


closePopupBtn.addEventListener('click', () => {
    popup.classList.remove('mostrar');
});


popup.addEventListener('click', (e) => {
    if (e.target === popup) {
        popup.classList.remove('mostrar');
    }
});


