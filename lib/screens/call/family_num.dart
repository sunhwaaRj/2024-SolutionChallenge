import 'package:abler_project/data_service.dart';
import 'package:abler_project/screens/call/add_family.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class familynumPage extends StatefulWidget {
  const familynumPage({super.key});

  @override
  State<familynumPage> createState() => _familynumPageState();
}

class _familynumPageState extends State<familynumPage> {
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          // const Text('가족전화페이지'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                              builder: (context) => const addFamilynum()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          backgroundColor: const Color(0xff1c3462)),
                      child: const Text(
                        '+ add Address',
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
                StreamBuilder<QuerySnapshot>(
                  stream: getFamilynum(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return const Text('Loading...');
                    return Column(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        // 변수 설정, 전화 위해
                        String number = document['number'];

                        //return Text("${document['name']}");
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: ElevatedButton(
                              onPressed: () async {
                                await FlutterPhoneDirectCaller.callNumber(
                                    number); // 이 때 바로 전화걸리는 게 아닌 세부 정보를 조회,,,
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor: const Color(0xffF6ED5D)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${document['name']}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${document['relationship']}",
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
