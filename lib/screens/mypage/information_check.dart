import 'package:flutter/material.dart';
import 'package:abler_project/data_service.dart';

class infoPage extends StatefulWidget {
  const infoPage({super.key});

  @override
  State<infoPage> createState() => _infoPageState();
}

class _infoPageState extends State<infoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('정보수정페이지'),
        ],
      ),
    );
  }
}
