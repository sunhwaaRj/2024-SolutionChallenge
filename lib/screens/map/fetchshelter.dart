import 'package:http/http.dart' as http;
import 'package:abler_project/screens/map/park.dart';
import 'package:abler_project/screens/map/key.dart';
import 'dart:convert';

Future<List<Park>> fetchPark() async {
  late List<Park> parkingList;
  String url =
      "http://openapi.seoul.go.kr:8088/$apiKey/json/GetParkInfo/1/5/용산";

  final response = await http.get(Uri.parse(url));
  final responseBody = response.body;

  final jsonMap = json.decode(responseBody);

  parkingList = jsonMap.containsKey("GetParkInfo")
      ? (jsonMap['GetParkInfo']['row'] as List)
          .map((e) => Park.fromJson(e))
          .toList()
      : List.empty();

  if (response.statusCode == 200) {
    return parkingList;
  } else {
    throw Exception('Failed to load park info');
  }
}
