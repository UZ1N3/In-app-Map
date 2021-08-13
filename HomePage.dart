import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading:
            IconButton(icon: const Icon(Icons.arrow_left), onPressed: () {}),
        title: Text("Patna"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Stack(
        children: [
          googlemap(context),
        ],
      ),
    );
  }
}

Widget customBox(String place) {
  return Container(
    width: 40,
    height: 30,
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        Image(
          image: AssetImage("assets/golghar.jpeg"),
          height: 18,
          width: 14,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          place,
          style: TextStyle(
            color: Colors.purple,
            fontSize: 20,
          ),
        )
      ],
    ),
  );
}

Widget customContainer() {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 10,
          ),
          Padding(padding: EdgeInsets.all(10)),
          customBox("Gol Ghar")
        ],
      ),
    ),
  );
}

Widget googlemap(BuildContext context) {
  return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(25.5941, 85.1376), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          var _controller;
          _controller.complete(controller);
        },
        minMaxZoomPreference: MinMaxZoomPreference.unbounded,
        markers: {patnaMarker1, patnaMarker2, patnaMarker3},
      ));
}

Marker patnaMarker1 = Marker(
  markerId: MarkerId("patnaMarker1"),
  position: LatLng(25.6209, 85.1603),
  infoWindow: InfoWindow(title: "PMCH Hospital"),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

Marker patnaMarker2 = Marker(
  markerId: MarkerId("patnaMarker2"),
  position: LatLng(25.6127, 85.1333),
  infoWindow: InfoWindow(title: "Patna Museum"),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

Marker patnaMarker3 = Marker(
  markerId: MarkerId("patnaMarker3"),
  position: LatLng(25.6341, 85.1064),
  infoWindow: InfoWindow(
    title: "P&M Mall",
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
