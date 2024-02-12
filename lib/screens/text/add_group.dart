// 그룹 추가 화면

import 'package:abler_project/data_service.dart';
import 'package:flutter/material.dart';

class addGroupnum extends StatefulWidget {
  const addGroupnum({super.key});

  @override
  State<addGroupnum> createState() => _addGroupnumState();
}

class _addGroupnumState extends State<addGroupnum> {
  // 유효성 체크
  TextEditingController addGroupnameController = TextEditingController();
  TextEditingController addGroupnumController = TextEditingController();
  TextEditingController addTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          // const Text('그룹 추가 화면입니다'),
          const Text(
            '그룹 추가하기',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
            width: MediaQuery.of(context).size.width * 0.5,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xff1c3462),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '그룹 이름',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: addGroupnameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '그룹 이름을 입력하세요',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  '전화번호',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: addGroupnumController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '전화번호를 입력하세요',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  '문자 내용',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: addTextFieldController,
                  minLines: 1,
                  // maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '문자 내용을 입력하세요',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      if (addGroupnameController.text.isEmpty ||
                          addGroupnumController.text.isEmpty ||
                          addTextFieldController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: const Text('내용을 입력하세요'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              )
                            ],
                          ),
                        );
                      } else {
                        //db에 추가
                        add_familytext(
                          addGroupnameController.text,
                          addGroupnumController.text,
                          addTextFieldController.text,
                        );
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: const Color(0xff1c3462)),
                    child: const Text(
                      '그룹 추가',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
