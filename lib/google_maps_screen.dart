import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:march25batch6pm/services/fetch_location.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  bool isLoading = false;
  late LatLng currantLatLng;
  late GoogleMapController _googleMapController;
  final Set<Circle> _circles = {};
  final Set<Polygon> _polygons = {};
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  CameraPosition defaultCameraPosition = const CameraPosition(
    target: LatLng(0, 0),
    zoom: 10,
  );

  Future _fetchCurrantLocation() async {
    LocationData data = await FindMyLocation.getCurrantLocation();
    setState(() {
      currantLatLng = LatLng(
        data.latitude!.toDouble(),
        data.longitude!.toDouble(),
      );
    });
    await _addCircleToMap();
    _setPolygon();
    _addMarkers();
    _addPolyline();
  }

  Future _addCircleToMap() async {
    _circles.add(
      Circle(
        circleId: const CircleId('myCircle'),
        center: currantLatLng,
        radius: 1000,
        // 1000 meters radius
        fillColor: Colors.red.withOpacity(0.3),
        strokeColor: Colors.red,
        strokeWidth: 2,
      ),
    );
  }

  void _setPolygon() {
    _polygons.add(
      Polygon(
        polygonId: const PolygonId('polygon_1'),
        points: const [
          LatLng(37.43296265331129, -122.08832357078792),
          LatLng(37.42796133580664, -122.085749655962),
          LatLng(37.418, -122.09),
          LatLng(37.423, -122.094),
        ],
        strokeColor: Colors.blue,
        strokeWidth: 3,
        fillColor: Colors.blue.withOpacity(0.2),
      ),
    );
    setState(() {});
  }

  void _addMarkers() {
    _markers.add(
      const Marker(
        markerId: MarkerId('marker_1'),
        position: LatLng(37.42796133580664, -122.085749655962),
        infoWindow: InfoWindow(title: 'Ahmedabad', snippet: 'This is marker 1'),
      ),
    );

    _markers.add(
      const Marker(
        markerId: MarkerId('marker_2'),
        position: LatLng(37.430, -122.090),
        infoWindow: InfoWindow(title: 'Vadodara', snippet: 'This is marker 2'),
      ),
    );

    setState(() {}); // Refresh map to show markers
  }

  void _addPolyline() {
    _polyline.add(
      const Polyline(
        polylineId: PolylineId('polyline_1'),
        points: [
          LatLng(37.42796133580664, -122.085749655962),
          LatLng(37.430, -122.090),
        ],
        color: Colors.pink,
        width: 5,
      ),
    );

    setState(() {}); // Refresh map to show polylines
  }

  @override
  void initState() {
    super.initState();
    _fetchCurrantLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps Screen"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: isLoading
              ? const LinearProgressIndicator()
              : const SizedBox.shrink(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            isLoading = true;
          });

          await _fetchCurrantLocation();

          setState(() {
            isLoading = false;

            _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: currantLatLng,
                  zoom: 15,
                ),
              ),
              duration: const Duration(seconds: 3),
            );
          });
        },
        child: const Icon(
          Icons.location_searching,
          size: 30,
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: defaultCameraPosition,
        onMapCreated: (GoogleMapController mapController) {
          _googleMapController = mapController;
          setState(() {});
        },
        buildingsEnabled: true,
        compassEnabled: true,
        liteModeEnabled: false,
        mapToolbarEnabled: false,
        fortyFiveDegreeImageryEnabled: true,
        indoorViewEnabled: true,
        myLocationButtonEnabled: true,
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: true,
        trafficEnabled: true,
        myLocationEnabled: true,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        cameraTargetBounds: CameraTargetBounds.unbounded,
        minMaxZoomPreference: MinMaxZoomPreference.unbounded,
        layoutDirection: TextDirection.ltr,
        circles: _circles,
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
          Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
        },
        polygons: _polygons,
        markers: _markers,
        polylines: _polyline,
        onTap: (value) {},
        onLongPress: (value) {},
        onCameraIdle: () {},
        onCameraMoveStarted: () {},
        onCameraMove: (CameraPosition position) {},
      ),
    );
  }
}
