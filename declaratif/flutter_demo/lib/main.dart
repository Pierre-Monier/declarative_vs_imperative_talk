import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/app_button.dart';
import 'package:flutter_demo/app_gif.dart';

const gifUrls = [
  "https://media.giphy.com/media/XknChYwfPnp04/giphy.gif",
  "https://media.giphy.com/media/GIgGwpcmV0VjO/giphy.gif",
  "https://media.giphy.com/media/zrCSvFfl2fP7W/giphy.gif",
  "https://media.giphy.com/media/149eCxEQPfhwyY/giphy.gif",
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GifPage(title: 'Flutter Demo'),
    );
  }
}

class GifPage extends StatefulWidget {
  const GifPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _GifPageState();
}

class _GifPageState extends State<GifPage> {
  String? gifUrl;

  void updateGifUrl() {
    if (gifUrl == null) {
      final randomIndex = Random().nextInt(gifUrls.length);

      setState(() {
        gifUrl = gifUrls[randomIndex];
      });
    } else {
      setState(() {
        gifUrl = null;
      });
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
            AppButton(
              isGifDisplayed: gifUrl != null,
              onPressed: () => updateGifUrl(),
            ),
            if (gifUrl != null) AppGif(gifUrl: gifUrl!)
          ],
        ),
      ),
    );
  }
}
