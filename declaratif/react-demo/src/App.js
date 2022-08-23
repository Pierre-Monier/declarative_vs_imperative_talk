import "./App.css";
import AppButton from "./app-button";
import React, { useState } from "react";

const gifUrls = [
  "https://media.giphy.com/media/XknChYwfPnp04/giphy.gif",
  "https://media.giphy.com/media/GIgGwpcmV0VjO/giphy.gif",
  "https://media.giphy.com/media/zrCSvFfl2fP7W/giphy.gif",
  "https://media.giphy.com/media/149eCxEQPfhwyY/giphy.gif",
];

function App() {
  const [gifUrl, setGifUrl] = useState(null);

  const updateGifUrl = () => {
    if (gifUrl) {
      setGifUrl(null);
    } else {
      const randomIndex = Math.floor(Math.random() * gifUrls.length);
      setGifUrl(gifUrls[randomIndex]);
    }
  };

  return (
    <div className="App">
      <h3>My awesome app</h3>
      <AppButton
        isGifDisplayed={gifUrl !== null}
        onClick={updateGifUrl}
      ></AppButton>
      {gifUrl !== null ? <img alt="" src={gifUrl}></img> : null}
    </div>
  );
}

export default App;
