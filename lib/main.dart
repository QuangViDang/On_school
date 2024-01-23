import 'package:flutter/material.dart';
import 'widgets/location/location_view.dart';
import 'widgets/qldt/quanly_sinhvien.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quan ly sinh vien",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản lý sinh viên"),
      ),
      body: QuanLySinhVien(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Chuyển đến trang thời tiết khi nhấn nút
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GeolocatorWidget()),
              );
            },
            child: Icon(Icons.location_on),
          ),
        ],
      ),
    );
  }
}
