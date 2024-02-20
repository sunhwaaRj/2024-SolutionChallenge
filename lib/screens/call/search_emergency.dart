import 'package:abler_project/data_service.dart';
import 'package:flutter/material.dart';

class addEmergencynum extends StatefulWidget {
  const addEmergencynum({super.key});

  @override
  State<addEmergencynum> createState() => _addEmergencynumState();
}

class _addEmergencynumState extends State<addEmergencynum> {
  // 유효성 체크
  TextEditingController addEmergnameController = TextEditingController();
  TextEditingController addEmergnumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        const Text(
          '연락처 추가하기',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
          // width: MediaQuery.of(context).size.width * 0.5,
          child: DecoratedBox(
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
                '기관명',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: addEmergnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '기관명을 입력하세요',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                '기관 전화번호',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: addEmergnumController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '0211112222( \'-\' 제외하고 작성 )',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    if (addEmergnameController.text.isEmpty ||
                        addEmergnumController.text.isEmpty) {
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
                      // 데이터베이스에 저장
                      add_emergencynum(
                        addEmergnameController.text,
                        addEmergnumController.text,
                      );
                      // 이전 화면으로 나가기
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: const Color(0xff1c3462),
                  ),
                  child: const Text(
                    '+ 기관명추가',
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
      ]),
    );
  }
}
