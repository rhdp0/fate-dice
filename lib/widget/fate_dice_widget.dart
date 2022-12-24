import 'package:flutter/material.dart';

class FateDice extends StatelessWidget {
  const FateDice({super.key, required this.sideValue});
  final String sideValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 125,
        height: 125,
        decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(),
            borderRadius: BorderRadius.circular(12)),
        child: Text(
          sideValue,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 100, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
