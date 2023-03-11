const grid = document.querySelector('.grid');
let squares = Array.from(document.querySelectorAll('.grid div'));
const scoreDisplay = document.querySelector('#score');
const startBtn = document.querySelector('#start-button');
const width = 10;
let nextRandom = 0;
let timerId = 0;
let score = 0;
const colors = [
  'orange',
  'red',
  'purple',
  'green',
  'blue'
];

// Tetrominoes
const lTetromino = [
  [1, width + 1, width * 2 + 1, 2],
  [width, width + 1, width + 2, width * 2 + 2],
  [1, width + 1, width * 2 + 1, width * 2],
  [width, width * 2, width * 2 + 1, width * 2 + 2]
];
const zTetromino = [
  [0, width, width + 1, width * 2 + 1],
  [width + 1, width + 2, width * 2, width * 2 + 1],
  [0, width, width + 1, width * 2 + 1],
  [width + 1, width + 2, width * 2, width * 2 + 1]
];
const tTetromino = [
  [1, width, width + 1, width + 2],
  [1, width + 1, width + 2, width * 2 + 1],
  [width, width + 1, width + 2, width * 2 + 1],
  [1, width, width + 1, width * 2 + 1]
];
const oTetromino = [
  [0, 1, width, width + 1],
  [0, 1, width, width + 1],
  [0, 1, width, width + 1],
  [0, 1, width, width + 1]
];
const iTetromino = [
  [1, width + 1, width * 2 + 1, width * 3 + 1],
  [width, width + 1, width + 2, width + 3],
  [1, width + 1, width * 2 + 1, width * 3 + 1],
  [width, width + 1, width + 2, width + 3]
];

const tetrominoes = [lTetromino, zTetromino, tTetromino, oTetromino, iTetromino];

let currentPosition = 4;
let currentRotation = 0;

// Randomly select tetromino type.
let random = Math.floor(Math.random() * tetrominoes.length);
let current = tetrominoes[0][0];

// Draw first rotation in 1st tetromino
function draw() {
  current.forEach((index) => {
    squares[currentPosition + index].classList.add('tetromino');
    squares[currentPosition + index].style.backgroundColor = colors[random];
  });
}

// Undraw the tetromino
function undraw() {
  current.forEach((index) => {
    squares[currentPosition + index].classList.remove('tetromino');
    squares[currentPosition + index].style.backgroundColor = '';
  });
}

const displaySquares = document.querySelectorAll('.mini-grid div');
const displayWidth = 4;
const displayIndex = 0;

// The tetromino without rotations
const upNextTetrominos = [
  [1, displayWidth + 1, displayWidth * 2 + 1, 2], // l
  [0, displayWidth, displayWidth + 1, displayWidth * 2 + 1], // z
  [1, displayWidth, displayWidth + 1, displayWidth + 2], // t
  [0, 1, displayWidth, displayWidth + 1], // o
  [1, displayWidth + 1, displayWidth * 2 + 1, displayWidth * 3 + 1] // i
];

function displayShape() {
  // remove any trace of a tetromino from the entire grid
  displaySquares.forEach((square) => {
    square.classList.remove('tetromino');
    // eslint-disable-next-line no-param-reassign
    square.style.backgroundColor = '';
  });
  upNextTetrominos(nextRandom).forEach((index) => {
    displaySquares[displayIndex + index].classList.add('tetromino');
    displaySquares[displayIndex + index].style.backgroundColor = colors[nextRandom];
  });
}

// Move tetromino to left if there is space.
function moveLeft() {
  undraw();
  const isatLeftEdge = current.some((index) => (currentPosition + index) % width === 0);
  if (!isatLeftEdge) currentPosition -= 1;
  if (current.some((index) => squares[currentPosition + index].classList.contains('taken'))) {
    currentPosition += 1;
  }
  draw();
}

// Move tetromino to right if there is space
function moveRight() {
  undraw();
  const isAtRightEdge = current.some((index) => (currentPosition + index) % width === width - 1);
  if (!isAtRightEdge) currentPosition += 1;
  if (current.some((index) => squares[currentPosition + index].classList.contains('taken'))) {
    currentPosition -= 1;
  }
  draw();
}

// Rotate the tetromino
function rotate() {
  undraw();
  currentRotation += 1;
  if (currentRotation === current.length) {
    currentRotation = 0;
  }
  current = theTetrominoes[random][currentRotation];
  draw();
}

function addScore() {
  for (let i = 0; i < 199; i += width) {
    const row = [i, i + 1, i + 2, i + 3, i + 4, i + 5, i + 6, i + 7, i + 8, i + 9];
    // eslint-disable-next-line no-loop-func
    if (row.every((index) => squares[index].classList.contains('taken'))) {
      score += 10;
      scoreDisplay.innerHTML = score;
      // eslint-disable-next-line no-loop-func
      row.forEach((index) => {
        squares[index].classList.remove('taken');
        squares[index].classList.remove('tetromino');
        squares[index].style.backgroundColor = '';
      });
      const squaresRemoved = squares.splice(i, width);
      squares = squaresRemoved.concat(squares);
      squares.forEach((cell) => grid.appendChild(cell));
    }
  }
}

// Define when the game is over.
function gameOver() {
  if (current.some((index) => squares[currentPosition + index].classList.contains('taken'))) {
    scoreDisplay.innerHTML = 'end';
    clearInterval(timerId);
  }
}

// Freeze tetromino, keeps it on grid.
function freeze() {
  if (current.some((index) => squares[currentPosition + index + width].classList.contains('taken'))) {
    current.forEach((index) => squares[currentPosition + index].classList.add('taken'));
    // Start a new tetronimo falling.
    random = nextRandom;
    nextRandom = Math.floor(Math.random() * tetrominoes.length);
    current = tetrominoes[random][currentRotation];
    currentPosition = 4;
    draw();
    displayShape();
    addScore();
    gameOver();
  }
}

// Shift tetronimo down the screen by an amount
function moveDown() {
  undraw();
  currentPosition += width;
  draw();
  freeze();
}

startBtn.addEventListener('click', () => {
  if (timerId) {
    clearInterval(timerId);
    timerId = null;
  } else {
    draw();
    timerId = setInterval(moveDown(), 1000);
    nextRandom = Math.floor(Math.random() * tetrominoes.length);
    displayShape();
  }
});

// Assign functions to KeyCodes
function control(e) {
  if (e.keyCode === 37) {
    moveLeft();
  } else if (e.keyCode === 38) {
    rotate();
  } else if (e.keyCode === 39) {
    moveRight();
  } else if (e.keyCode === 40) {
    moveDown();
  }
}
document.addEventListener('keyup', control);
