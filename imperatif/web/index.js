const gifUrls = [
  "https://media.giphy.com/media/XknChYwfPnp04/giphy.gif",
  "https://media.giphy.com/media/GIgGwpcmV0VjO/giphy.gif",
  "https://media.giphy.com/media/zrCSvFfl2fP7W/giphy.gif",
  "https://media.giphy.com/media/149eCxEQPfhwyY/giphy.gif",
];

function onClick() {
  const gifContainer = document.getElementById("gif-container");
  const gif = document.querySelector("img");
  const isGifAlreadyDisplay = gif !== null;

  updateLabel(isGifAlreadyDisplay);

  if (isGifAlreadyDisplay) {
    removeGif(gifContainer, gif);
  } else {
    insertGif(gifContainer);
  }
}

function removeGif(gifContainer, gif) {
  gifContainer.removeChild(gif);
}

function insertGif(gifContainer) {
  const gif = document.createElement("img");
  const randomIndex = Math.floor(Math.random() * gifUrls.length);
  gif.src = gifUrls[randomIndex];
  gifContainer.appendChild(gif);
}

function updateLabel(isGifAlreadyDisplay) {
  const buttonLabel = document.getElementById("button-label");
  const text = isGifAlreadyDisplay
    ? "Click to show cool gif"
    : "Click to remove this cool gif";

  buttonLabel.innerText = text;
}
