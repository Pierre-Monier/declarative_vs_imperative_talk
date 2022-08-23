import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {required this.isGifDisplayed, required this.onPressed, Key? key})
      : super(key: key);

  final bool isGifDisplayed;
  final void Function() onPressed;

  String get label => isGifDisplayed
      ? "Click to remove this cool gif"
      : "Click to show cool gif";

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
