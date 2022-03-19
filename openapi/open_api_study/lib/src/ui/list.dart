import 'package:open_api_study/src/model/ev.dart';
import 'package:open_api_study/src/provider/ev_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListWidget extends StatefulWidget {
  ListWidget({Key? key}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  Completer<GoogleMapController> _controller = Completer();
  bool tf = true;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  LatLng _center = LatLng(37.56795, 127.06619);

  static final CameraPosition _start = CameraPosition(
    //프로그램 실행 시 처음으로 보여줄 지도의 좌표
    target: LatLng(37.56795, 127.06619),
    zoom: 14,
  );

  @override
  void initState() {
    //초기화
    _checkPermission();
    super.initState();
  }

  //지도를 사용하기 위해서는 접근 권한을 허용해야 한다.
//앱 실행 시 접근 권한이 허용되었는지 체크
//만약 권한이 없다면 권한 설정 창 띄우기
  _checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    var mapController = controller;

    final marker = Marker(
      markerId: MarkerId('place_name'),
      position: LatLng(37.56795, 127.06619),
      infoWindow: InfoWindow(title: "서울", snippet: 'address'),
    );

    setState(() {
      markers[MarkerId('place_name')] = marker;
    });
  }

  late EvProvider _evProvider;
  // EvProvider 호출
  Widget _makeEvOne(Ev ev) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 도서관명
              Text(
                ev.CLTUR_EVENT_ETC_NM.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),

              // 자치구명
              Text(
                ev.ATDRC_NM.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              SizedBox(
                height: 10,
              ),

              // 기본주소
              Text(
                "기본주소 : " +
                    ev.BASS_ADRES.toString() +
                    " " +
                    ev.DETAIL_ADRES.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              SizedBox(
                height: 10,
              ),

              // // 상세주소
              // Text(
              //   ev.DETAIL_ADRES.toString(),
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              // ),
              // SizedBox(
              //   height: 10,
              // ),

              // 사용료 무료 여부
              Text(
                "사용료 무료 여부 : " + ev.RNTFEE_FREE_AT.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              SizedBox(
                height: 10,
              ),

              // 안내 URL
              Text(
                "안내 URL : " + ev.GUIDANCE_URL.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              SizedBox(
                height: 10,
              ),

              // 위도
              Text(
                "위도 : " + ev.Y_CRDNT_VALUE.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              SizedBox(
                height: 10,
              ),

              // 경도
              Text(
                "경도 : " + ev.X_CRDNT_VALUE.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ],
          ),
        ))
      ],
    );
  }

  // 리스트 뷰
  Widget _makeListView(List<Ev> evs) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 14.0,
      ),
      markers: markers.values.toSet(),
    );
    // return
    // ListView.separated(
    //   itemCount: evs.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return GoogleMap(
    //       onMapCreated: _onMapCreated,
    //       initialCameraPosition: CameraPosition(
    //         target: _center,
    //         zoom: 14.0,
    //       ),
    //       markers: markers.values.toSet(),
    //     );
    //     // return Container(
    //     //     height: 300, color: Colors.white, child: _makeEvOne(evs[index]));
    //   },
    //   separatorBuilder: (BuildContext context, int index) {
    //     return Divider();
    //   },
    // );
  }

  // Widget _viewmap(List<Ev> evs) {
  //   return GoogleMap(
  //     onMapCreated: _onMapCreated,
  //     initialCameraPosition: CameraPosition(
  //       target: _center,
  //       zoom: 14.0,
  //     ),
  //     markers: markers.values.toSet(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // Provider.of를 통해 데이터를 접근한다. builder만을 업데이트 하기 위해 listen은 false로 한다.
    _evProvider = Provider.of<EvProvider>(context, listen: false);
    _evProvider.loadEvs(); // EvProvider에 loadEvs()의 접근

    return Scaffold(
        appBar: AppBar(
          title: Text("Ev Provider"),
        ),
        // Consumer를 통해 데이터를 접근
        body: Consumer<EvProvider>(builder: (context, provider, wideget) {
          // 데이터가 있으면 _makeListView에 데이터를 전달
          if (provider.evs != null && provider.evs.length > 0) {
            return _makeListView(provider.evs);
            // _viewmap(provider.evs);
          }

          // 데이터가 없으면 CircularProgressIndicator 수행(로딩)
          return Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
