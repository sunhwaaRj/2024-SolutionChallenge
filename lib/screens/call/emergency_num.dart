import 'package:abler_project/data_service.dart';
import 'package:abler_project/screens/call/search_emergency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class emergencyCall extends StatefulWidget {
  const emergencyCall({super.key});

  @override
  State<emergencyCall> createState() => _emergencyCallState();
}

class _emergencyCallState extends State<emergencyCall> {
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Column(
              children: [
                const Text(
                  '기관 긴급 전화',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                  color: Colors.red[300],
                ),
                const SizedBox(
                  height: 15,
                ),

                // 정보 목록 나타내기
                // streambuilder
                StreamBuilder<QuerySnapshot>(
                  stream: getEmergencynum(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return const Text('Loading...');
                    return Column(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        String emergnumber = document['emergNum'];
                        // return Text('${document['emergName']} : ${document['emergNum']}');
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: OutlinedButton(
                              onPressed: () async {
                                await FlutterPhoneDirectCaller.callNumber(
                                    emergnumber);
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                side: const BorderSide(
                                  width: 2.0, // 테두리 두께
                                  color: Color(0xff1c3462),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${document['emergName']}',
                                    style: const TextStyle(
                                      color: Color(0xff1c3462),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Text(
                                    '|',
                                    style: TextStyle(
                                      color: Color(0xff1c3462),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    '${document['emergNum']}',
                                    style: const TextStyle(
                                      color: Color(0xff1c3462),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 30,
                                    color: Color(0xff1c3462),
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
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const addEmergencynum()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: Colors.red[800],
                      ),
                      child: const Text(
                        '+',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
