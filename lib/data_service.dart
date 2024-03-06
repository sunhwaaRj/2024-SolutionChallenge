import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

// 컬렉션 이름
CollectionReference familynumCollection = firestore.collection('familynum');
CollectionReference familytextCollection = firestore.collection('familytext');
CollectionReference emergencynumCollection =
    firestore.collection('emergencynum');
CollectionReference myinfoCollection = firestore.collection('myInfo');

// 리뷰컬렉션에 리뷰데이터 저장
// 가족전화 추가
void add_familynum(String name, String familynumber, String relationship) {
  familynumCollection.add({
    'name': name,
    'number': familynumber,
    'relationship': relationship,
  }).then((value) => print('familynum added'));
}

// 가족문자 / 그룹추가
void add_familytext(String groupName, String groupNum, String textField) {
  familytextCollection.add({
    'groupName': groupName,
    'groupNum': groupNum,
    'textField': textField,
  }).then((value) => print('familytext added'));
}

// 긴급전화
void add_emergencynum(String emergName, String emergeNum) {
  emergencynumCollection.add({
    'emergName': emergName,
    'emergNum': emergeNum,
  }).then((value) => print('emergencynum added'));
}

// 내 정보 수정
void update_myinfo(String allergy, String birth, String bloodtype,
    String myname, String nation) {
  myinfoCollection.doc('0s2efN650OI1DDOxLTwn').update({
    'allergy': allergy,
    'birth': birth,
    'bloodtype': bloodtype,
    'myname': myname,
    'nation': nation,
  }).then((value) => print('myinfo updated'));
}

// familynum컬렉션의 데이터 조회
// 후에 로그인 기능 추가하면 해당 id에 담고 있는 정보와 일치 데이터 조회
Stream<QuerySnapshot> getFamilynum() {
  return familynumCollection.snapshots();
}

// familytext컬렉션의 데이터 조회
Stream<QuerySnapshot> getFamilytext() {
  return familytextCollection.snapshots();
}

// emergencynum컬렉션의 데이터 조회
Stream<QuerySnapshot> getEmergencynum() {
  return emergencynumCollection.orderBy("emergName").snapshots();
}

// myinfo컬렉션의 데이터 조회
Stream<QuerySnapshot> getMyinfo() {
  return myinfoCollection.snapshots();
}
