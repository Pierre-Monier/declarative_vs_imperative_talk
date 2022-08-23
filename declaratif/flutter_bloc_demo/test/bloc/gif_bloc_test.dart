import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_demo/bloc/gif_bloc.dart';
import 'package:flutter_demo/bloc/gif_event.dart';
import 'package:flutter_demo/bloc/gif_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest<GifBloc, GifState>(
    "It should have HidingGif state has default state",
    build: () => GifBloc(),
    verify: (bloc) => bloc.state == const HidingGif(),
  );

  blocTest<GifBloc, GifState>(
    "It should emit ShowingGif state when ShowGif event is trigger",
    build: () => GifBloc(),
    act: (bloc) => bloc.add(ShowGif()),
    expect: () => [isA<ShowingGif>()],
  );

  blocTest<GifBloc, GifState>(
    "It should emit HidingGif state when HideGif event is trigger",
    build: () => GifBloc(),
    act: (bloc) => bloc.add(HideGif()),
    expect: () => [const HidingGif()],
  );
}
