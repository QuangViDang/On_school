import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorExample extends StatefulWidget {
  @override
  _GeolocatorExampleState createState() => _GeolocatorExampleState();
}

class _GeolocatorExampleState extends State<GeolocatorExample> {
  String _latitude = 'Unknown';
  String _longitude = 'Unknown';

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await _requestLocationPermission();
    }
  }

  Future<void> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever) {
      // Handle the case where the user has permanently denied location permission
      print('Location permission denied forever');
    } else if (permission == LocationPermission.denied) {
      // Handle the case where the user denied location permission
      print('Location permission denied');
    } else {
      // Permission granted, now get the location
      _getLocation();
    }
  }

  Future<void> _getLocation() async {
    try {
      // Lấy vị trí hiện tại của thiết bị
      Position position = await Geolocator.getCurrentPosition();

      setState(() {
        _latitude = position.latitude.toString();
        _longitude = position.longitude.toString();
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Latitude: $_latitude'),
            Text('Longitude: $_longitude'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _requestLocationPermission();
              },
              child: Text('Get Location'),
            ),
          ],
        ),
      ),
    );
  }
}
