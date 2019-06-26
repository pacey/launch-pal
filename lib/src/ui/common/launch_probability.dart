import 'package:flutter/material.dart';

class LaunchProbability extends StatelessWidget {
  final int probability;

  const LaunchProbability({Key key, this.probability}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(probability == -1 ? "Unknown" : "$probability%"),
    );
  }
}
