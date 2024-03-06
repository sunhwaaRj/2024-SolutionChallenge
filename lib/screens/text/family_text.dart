import 'package:abler_project/data_service.dart';
import 'package:abler_project/screens/text/add_group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// 정보목록 나타내기

class familytextPage extends StatefulWidget {
  const familytextPage({super.key});

  @override
  State<familytextPage> createState() => _familytextPageState();
}

class _familytextPageState extends State<familytextPage> {
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          // const Text('문자 전송 페이지'),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 5,
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const addGroupnum()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          backgroundColor: const Color(0xff1c3462)),
                      child: const Text(
                        '+ ADD Group',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // 정보 목록 나타내기
                // streambuilder
                // 버튼으로 눌러서 문자 보내기
                // 일단 예제 container로 해보자
                /* 
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.2,
                    child: ElevatedButton(
                      onPressed: () async {
                        // await sendSMS(
                        // message: '문구', recipients: ['01021950625']);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: const Color(0xff1c3462)),
                      child: const Text(
                        '문자 전송',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),*/
                StreamBuilder<QuerySnapshot>(
                  stream: getFamilytext(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return const Text('Loading...');
                    return Column(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        // 변수 설정, 전화 위해
                        String number = document['groupNum'];

                        //return Text("${document['name']}");
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: ElevatedButton(
                              onPressed: () async {},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor: const Color(0xff9ACD32)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${document['groupName']}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${document['textField']}",
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
