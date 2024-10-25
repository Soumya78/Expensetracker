
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    double progress = 0.5;
    return SizedBox(height: 10, child: LinearProgressIndicator(value: progress));
  }
}
