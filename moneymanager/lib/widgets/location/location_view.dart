import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String _cityName = '';

  @override
  void initState() {
    super.initState();
    _getLocationData();
  }

  Future<void> _getLocationData() async {
    try {
      // Lấy vị trí hiện tại của thiết bị
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      // Lấy thông tin địa chỉ từ vị trí
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        // Lấy tên thành phố từ địa chỉ
        setState(() {
          _cityName = placemarks.first.locality ?? 'Unknown City';
        });
      }
    } catch (e) {
      print('Error getting location data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Information"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'City Name: $_cityName',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
