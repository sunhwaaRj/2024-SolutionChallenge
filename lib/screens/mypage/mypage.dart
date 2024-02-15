import 'package:flutter/material.dart';

class myPage extends StatefulWidget {
  const myPage({super.key});

  @override
  State<myPage> createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.person,
            size: 250.0,
            color: Color(0xff1c3462),
          ),
          SizedBox(
            height: 20,
          ),
          Text('이름'),
        ],
      ),
    );
  }
}
