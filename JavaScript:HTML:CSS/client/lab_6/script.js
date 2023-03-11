function getRandomIntInclusive(min, max) {
  const mini = Math.ceil(min);
  const maxi = Math.floor(max);
  return Math.floor(Math.random() * (maxi - mini + 1) + mini);
}

function restArrayFiller(dataIn) {
  console.log('form submission'); // this is substituting for a "breakpoint"
  // console.table(dataIn); // this is called "dot notation"
  const range = [...Array(15).keys()];
  const dataSet = range.map((item, index) => {
    const restNum = getRandomIntInclusive(0, dataIn.length - 1);
    return dataIn[restNum];
  });
  // console.log(dataSet);
  // forEach example
  // range.forEach((item) => {
  //  console.log('range item', item);
  // };
  return dataSet;
}

function createHTMLList(listIn) {
  // console.log('Fired HTML creator')
  // console.log(listIn);
  const targetlist = document.querySelector('.rest_list');
  targetlist.innerHTML = '';
  listIn.forEach((item) => {
    const {name} = item;
    const displayName = name.slice(0, 1) + name.slice(1, name.length + 1).toLowerCase();
    const injectThisItem = `<li> ${displayName} </li>`;
    // console.log(injectThisItem);
    targetlist.innerHTML += injectThisItem;
  });
}

async function mainEvent() { // the async keyword means we can make API requests
  const form = document.querySelector('.main_form');
  const submit = document.querySelector('.submit_button'); // Get the submit button.
  const results = await fetch('/api/foodServicesPG'); // This accesses some data from our API
  const arrayFromJson = await results.json(); // This changes it into data we can use - an object

  // submit.addEventListener('mouseover', submit.style.setProperty('display:', 'none'));
  // Change the display style on mouse over.

  if (arrayFromJson.data.length > 0) {
    submit.style.display = 'block'; // Change the display style on mouse over.
    form.addEventListener('submit', async (submitEvent) => { // async has to be declared all the way to get an await
      submitEvent.preventDefault(); // This prevents your page from refreshing!
      // arrayFromJson.data - we're accessing a key called 'data' on the returned object
      // it contains all 1,000 records we need
      const restArray = restArrayFiller(arrayFromJson.data);
      createHTMLList(restArray);
    });
  }
}

// this actually runs first! It's calling the function above
document.addEventListener('DOMContentLoaded', async () => mainEvent()); // the async keyword means we can make API requests
