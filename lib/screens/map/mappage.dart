import 'dart:math';

import 'package:abler_project/screens/map/fetchpark.dart';
import 'package:abler_project/screens/map/googleMapPage.dart';
import 'package:abler_project/screens/map/park.dart';
import 'package:abler_project/screens/map/dphelper.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class mapPage extends StatefulWidget {
  const mapPage({super.key});

  @override
  State<mapPage> createState() => _mapPageState();
}

class _mapPageState extends State<mapPage> {
  late Future<List<Park>> parks;

  @override
  void initState() {
    super.initState();
    parks = fetchPark();
    /* */
    parks.then((value) => value.forEach((element) {
          print(element.parking_name);
          print(element.parking_code);
          print(element.lat);
          print(element.lng);
          var tmpPark = Park(
            parking_name: element.parking_name,
            parking_code: element.parking_code,
            lat: element.lat,
            lng: element.lng,
          );
          DBHelper().insertPark(tmpPark);
        }));
  }

  @override
  Widget build(BuildContext context) {
    /*  */
    return Scaffold(
      /* 
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('주차장명'),
          Text('주차코드'),
          Text('위도위치'),
          Text('경도위치'),
        ],
      ),*/
      body: Center(
        child: FutureBuilder<List<Park>>(
          future: parks,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // snapshot 데이터가 있으면 호출한 정보 출력
                children: [
                  Text(snapshot.data!.isNotEmpty
                      ? snapshot.data![0].parking_name
                      : "없음"),
                  Text(snapshot.data!.isNotEmpty
                      ? snapshot.data![0].parking_code
                      : "없음"),
                  Text(snapshot.data!.isNotEmpty
                      ? snapshot.data![0].lat.toString()
                      : "없음"),
                  Text(snapshot.data!.isNotEmpty
                      ? snapshot.data![0].lng.toString()
                      : "없음"),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.local_parking),
            onPressed: () {
              DBHelper dbHelper = DBHelper();
              dbHelper.parks().then((value) => value.forEach((element) {
                    print(
                        'parking_code: ${element.parking_code}, parking name: ${element.parking_name}');
                  }));
            },
          )
        ],
      ),
    );
  }
}
