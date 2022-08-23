import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/app_button.dart';
import 'package:flutter_demo/app_gif.dart';
import 'package:flutter_demo/bloc/gif_bloc.dart';
import 'package:flutter_demo/bloc/gif_event.dart';
import 'package:flutter_demo/bloc/gif_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => GifBloc(),
        child: const GifPage(title: 'Flutter Demo'),
      ),
    );
  }
}

class GifPage extends StatelessWidget {
  const GifPage({Key? key, required this.title}) : super(key: key);

  final String title;

  String? getGifUrl(GifState state) {
    if (state is ShowingGif) {
      return state.gifUrl;
    }

    return null;
  }

  void updateGifUrl({required GifBloc bloc, required GifState state}) {
    if (state is ShowingGif) {
      bloc.add(HideGif());
    } else {
      bloc.add(ShowGif());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const Text(
              "My awesome app",
              style: TextStyle(fontSize: 24),
            ),
            BlocBuilder<GifBloc, GifState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppButton(
                      isGifDisplayed: state is ShowingGif,
                      onPressed: () => updateGifUrl(
                        bloc: context.read<GifBloc>(),
                        state: state,
                      ),
                    ),
                    if (state is ShowingGif) AppGif(gifUrl: state.gifUrl)
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
