function getRandomIntInclusive(min, max) {
  const mini = Math.ceil(min);
  const maxi = Math.floor(max);
  return Math.floor(Math.random() * (maxi - mini + 1) + mini);
}

function restArrayFiller(dataIn) {
  // console.log('form submission'); // this is substituting for a "breakpoint"
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

function createHTMLList(listIn) { // Populates the list elements in the HTML model.
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

function initMap(targetId) {
  const latLong = [38.784, -76.872];
  const map = L.map(targetId).setView(latLong, 13);
  L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'pk.eyJ1IjoiZGRlbmVhdSIsImEiOiJjbDJudTNqaHUxYXpqM2tteDVxaDBhZ2FuIn0.LqRchsud0sx2eWQLcYrbDg'
  }).addTo(map);
  return map;
}

function addMapMarkers(map, listIn) {
  listIn.forEach((item) => {
    const point = item.geocoded_column_1?.coordinates;
    console.log(point);
    L.marker([point[1], point[0]]).addTo(map);
  });
}

async function mainEvent() { // the async keyword means we can make API requests
  const form = document.querySelector('.main_form');
  const submit = document.querySelector('.submit_button'); // Get the submit button.
  const restName = document.querySelector('#rest_name');
  const zip = document.querySelector('#zipcode');

  const map = initMap('map');
  const retrievalVar = 'restaurants';

  submit.style.dislay = 'none';

  if (localStorage.getItem(retrievalVar) !== undefined) {
    const results = await fetch('/api/foodServicesPG'); // This accesses some data from our API
    const arrayFromJson = await results.json(); // This changes it into data we can use - an object
    localStorage.setItem(retrievalVar, JSON.stringify(arrayFromJson.data));
  }

  const storedDataStr = localStorage.getItem(retrievalVar);
  const storedDataArr = JSON.parse(storedDataStr);
  console.log(storedDataArr);

  if (storedDataArr.length > 0) { // Makes sure that array is filled
  // before we start operating with it.
    submit.style.display = 'block'; // Change the display style on mouse over.

    let currentArray = [];
    restName.addEventListener('input', async (event) => {
      // console.log(event.target.value);
      if (currentArray.length < 1) {
        return;
      }
      const selectRest = storedDataArr.filter((item) => {
        // console.log(item);
        // console.log(item.name);
        const lowerName = item.name.toLowerCase();
        const lowerValue = event.target.value.toLowerCase();
        return lowerName.includes(lowerValue);
      });

      createHTMLList(selectRest);
      // console.log(matchRestName);
    });

    zip.addEventListener('input', async (event) => {
      if (currentArray.length < 1) {
        return;
      }

      const selectZip = storedDataArr.filter((item) => {
        console.log(item.zip);
        console.log(event.target.value);
        const zipString = item.zip.toString();
        return zipString === event.target.value.toString();
      });
      // console.log(selectZip);
      createHTMLList(selectZip);
    });

    form.addEventListener('submit', async (submitEvent) => { // async has to be declared all the way to get an await
      submitEvent.preventDefault(); // This prevents your page from refreshing!
      // arrayFromJson.data - we're accessing a key called 'data' on the returned object
      // it contains all 1,000 records we need
      currentArray = restArrayFiller(storedDataArr);
      createHTMLList(currentArray);
      addMapMarkers(map, currentArray);
      console.log(currentArray);
    });
  }
}

// this actually runs first! It's calling the function above
document.addEventListener('DOMContentLoaded', async () => mainEvent()); // the async keyword means we can make API requests
