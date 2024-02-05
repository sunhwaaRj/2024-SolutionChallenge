import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

// 컬렉션 이름
CollectionReference familynumCollection = firestore.collection('familynum');

// 리뷰컬렉션에 리뷰데이터 저장
void add_familynum(String name, String familynumber, String relationship) {
  familynumCollection.add({
    'name': name,
    'number': familynumber,
    'relationship': relationship,
  }).then((value) => print('review added'));
}

// 리뷰컬렉션의 데이터 조회
// 후에 로그인 기능 추가하면 해당 id에 담고 있는 정보와 일치 데이터 조회
Stream<QuerySnapshot> getFamilynum() {
  return familynumCollection.snapshots();
}

// 번호 받을 때 저장되면 1011112222 로 저장됨, 변수 받아 넣을 때 +82 앞에 넣도록