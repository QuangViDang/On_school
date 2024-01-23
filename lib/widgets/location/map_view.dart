import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class LocationDetails extends StatefulWidget {
  final double latitude;
  final double longitude;

  LocationDetails({required this.latitude, required this.longitude});

  @override
  _LocationDetailsState createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  String _cityName = 'Loading...';

  @override
  void initState() {
    super.initState();
    _getCityName();
  }

  Future<void> _getCityName() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        widget.latitude,
        widget.longitude,
      );

      if (placemarks.isNotEmpty) {
        print(placemarks.first.country);
        print(placemarks.first.locality);
        print(placemarks.first.locality);

        setState(() {
          _cityName = placemarks.first.country! +
              " - " +
              placemarks.first.administrativeArea! +
              " - " +
              placemarks.first.subAdministrativeArea! +
              " - " +
              placemarks.first.subLocality!;
        });
      }
    } catch (e) {
      print('Error getting location details: $e');
      setState(() {
        _cityName = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Latitude: ${widget.latitude}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Longitude: ${widget.longitude}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              _cityName != "" ? '$_cityName' : "City UnKnown",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
