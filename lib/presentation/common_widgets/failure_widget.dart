import 'package:flutter/material.dart';

/// Class that represents an error message. It's in "Common widgets" because
/// it's used on both screens so we don't duplicate widget
class FailureWidget extends StatelessWidget {
  final String text;

  const FailureWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.4,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
