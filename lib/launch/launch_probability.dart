import 'package:flutter/material.dart';

class LaunchProbability extends StatelessWidget {
  final int probability;

  const LaunchProbability({Key key, this.probability}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(probability == -1 ? "Unknown" : "$probability%"),
      labelStyle: TextStyle(color: Colors.white),
      backgroundColor:
          probability == -1 ? Colors.black87 : Colors.green[probability * 10],
    );
  }
}
