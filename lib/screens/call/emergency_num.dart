import 'package:flutter/material.dart';

class emergencyCall extends StatefulWidget {
  const emergencyCall({super.key});

  @override
  State<emergencyCall> createState() => _emergencyCallState();
}

class _emergencyCallState extends State<emergencyCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('긴급전화 페이지'),
        ],
      ),
    );
  }
}
