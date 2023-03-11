let slidePosition = 0; // Index for current slide.
const slides = document.querySelectorAll('.carousel-item'); // div with carousel items
const slidesArray = Array.from(slides); // An array built from the carousel items.
const totalSlides = slidesArray.length; // Count of the number of slides in carousel.

// Changes the visibility of each slide (by swapping visibile and hidden class names).
function updateSlidePosiion() {
  slidesArray.forEach((slide) => {
    console.log(slide);
    slides.classList.remvove('.carousel_item--visible');
    slides.classList.add('.carousel_item--hidden');
  });

  slidesArray[slidePosition].classList.add('.carousel_item--visible');
}

function moveToNextSlide() {
  updateSlidePosiion();

  if (slidePosition === totalSlides - 1) {
    slidePosition = 0;
  } else {
    slidePosition += 1;
  }
}

function moveToPrevSlide() {
  if (slidePosition - 1 === totalSlides) {
    slidePosition = 0;
  } else {
    slidePosition -= 1;
  }

  updateSlidePosiion();
}

// Query Selectors (finding buttons & adding functionality)
document.querySelector('.button-next').addEventListener('click', () => {
  moveToNextSlide();
  console.log('clicked next');
});

document.querySelector('.button-prev').addEventListener('click', () => {
  moveToPrevSlide();
  console.log('clicked prev');
});
