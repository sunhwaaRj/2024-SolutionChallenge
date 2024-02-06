import 'package:flutter/material.dart';

class familytextPage extends StatefulWidget {
  const familytextPage({super.key});

  @override
  State<familytextPage> createState() => _familytextPageState();
}

class _familytextPageState extends State<familytextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('문자전송 페이지'),
        ],
      ),
    );
  }
}
