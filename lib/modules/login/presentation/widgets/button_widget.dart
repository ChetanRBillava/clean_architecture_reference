import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  final String buttonText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: Text(buttonText));
  }
}
