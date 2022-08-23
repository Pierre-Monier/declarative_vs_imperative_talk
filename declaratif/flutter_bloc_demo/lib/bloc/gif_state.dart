abstract class GifState {
  const GifState();
}

class ShowingGif extends GifState {
  const ShowingGif(this.gifUrl);
  final String gifUrl;
}

class HidingGif extends GifState {
  const HidingGif();
}
