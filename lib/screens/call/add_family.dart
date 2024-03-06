import 'package:abler_project/data_service.dart';
import 'package:flutter/material.dart';

class addFamilynum extends StatefulWidget {
  const addFamilynum({super.key});

  @override
  State<addFamilynum> createState() => _addFamilynumState();
}

class _addFamilynumState extends State<addFamilynum> {
  // 유효성 체크
  TextEditingController addNameController = TextEditingController();
  TextEditingController addPhonenumController = TextEditingController();
  TextEditingController addRelationshipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const Text(
            'ADDRESS',
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
                color: Color(0xffF6ED5D),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'NAME',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: addNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Input name',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: addPhonenumController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '01000000000( except \'-\'  )',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Relationship',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: addRelationshipController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Input relationship. (ex) son',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      if (addNameController.text.isEmpty ||
                          addPhonenumController.text.isEmpty ||
                          addRelationshipController.text.isEmpty) {
                        // 입력을 안했으면 팝업 띄우기
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
                        // 데이버베이스에 저장
                        add_familynum(
                            addNameController.text,
                            addPhonenumController.text,
                            addRelationshipController.text);
                        // 이전 화면으로 나가기
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: const Color(0xff1c3462)),
                    child: const Text(
                      '+ add Address',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
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
