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
  late LatLng latLng;
  late GoogleMapController _googleMapController;

  CameraPosition defaultCameraPosition = const CameraPosition(
    target: LatLng(0, 0),
    zoom: 10,
  );

  Future _fetchCurrantLocation() async {
    LocationData data = await FindMyLocation.getCurrantLocation();
    setState(() {
      latLng = LatLng(
        data.latitude!.toDouble(),
        data.longitude!.toDouble(),
      );
    });
  }

  @override
  void initState() {
    super.initState();
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
                  target: latLng,
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
        liteModeEnabled: true,
        mapToolbarEnabled: false,
        fortyFiveDegreeImageryEnabled: true,
        indoorViewEnabled: true,
        myLocationButtonEnabled: true,
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: true,
        trafficEnabled: true,
      ),
    );
  }
}
