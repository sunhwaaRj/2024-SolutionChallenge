// 주차장 정보를 담아놓는다
// 추후에 우리가 원하는 위치 정보로

class Park {
  final String parking_name;
  final String parking_code;
  final double lat;
  final double lng;
  Park(
      {required this.parking_name,
      required this.parking_code,
      required this.lat,
      required this.lng});

  // JSON 형식을 Park 오브젝트로 변환
  Park.fromJson(Map<String, dynamic> json)
      : parking_name = json['PARKING_NAME'],
        parking_code = json['PARKING_CODE'],
        lat = json['LAT'],
        lng = json['LNG'];

  // Park 오브젝트를 JSON 형식으로 변환
  Map<String, dynamic> toJson() => {
        'PARKING_NAME': parking_name,
        'PARKING_CODE': parking_code,
        'LAT': lat,
        'LNG': lng,
      };
}
