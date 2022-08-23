function AppButton(props) {
  const getLabel = (isGifDisplayed) =>
    isGifDisplayed ? "Click to remove this cool gif" : "Click to show cool gif";

  return (
    <button onClick={() => props.onClick()}>
      <p>{getLabel(props.isGifDisplayed)}</p>
    </button>
  );
}

export default AppButton;
