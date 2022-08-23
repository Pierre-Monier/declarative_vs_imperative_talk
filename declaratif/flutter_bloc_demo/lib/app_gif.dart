import 'package:flutter/material.dart';

class AppGif extends StatelessWidget {
  const AppGif({required this.gifUrl, Key? key}) : super(key: key);

  final String gifUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Image.network(
        gifUrl,
      ),
    );
  }
}
