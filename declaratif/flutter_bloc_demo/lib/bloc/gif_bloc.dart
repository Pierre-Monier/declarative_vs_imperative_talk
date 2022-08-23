import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_demo/bloc/gif_event.dart';
import 'package:flutter_demo/bloc/gif_state.dart';

const gifUrls = [
  "https://media.giphy.com/media/XknChYwfPnp04/giphy.gif",
  "https://media.giphy.com/media/GIgGwpcmV0VjO/giphy.gif",
  "https://media.giphy.com/media/zrCSvFfl2fP7W/giphy.gif",
  "https://media.giphy.com/media/149eCxEQPfhwyY/giphy.gif",
];

class GifBloc extends Bloc<GifEvent, GifState> {
  GifBloc() : super(const HidingGif()) {
    on<HideGif>((event, emit) => emit(const HidingGif()));
    on<ShowGif>(((event, emit) => _showGif(emit)));
  }

  void _showGif(Emitter<GifState> emit) {
    final randomIndex = Random().nextInt(gifUrls.length);
    final gifUrl = gifUrls[randomIndex];

    emit(ShowingGif(gifUrl));
  }
}
