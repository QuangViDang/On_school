import 'package:flutter/material.dart';
import '/../../models/sinhvien.dart';
import 'danhsach_sinhvien.dart';
import 'formnhap_sinhvien.dart';

class QuanLySinhVien extends StatefulWidget {
  @override
  _QuanLySinhVienState createState() => _QuanLySinhVienState();
}

class _QuanLySinhVienState extends State<QuanLySinhVien> {
  List<SinhVien> danhSachSinhVien = [
    SinhVien(
      ma: 12345678,
      hoVaTen: "Nguyen Thi Huong",
      ngaySinh: DateTime(2002, 8, 20),
      diemTotNghiep: 8.2,
    ),
    SinhVien(
      ma: 22334455,
      hoVaTen: "Tran Van Doan",
      ngaySinh: DateTime(1999, 12, 7),
      diemTotNghiep: 7.9,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FormNhapSinhVien(onThemSinhVien: _themSinhVien),
        DanhSachSinhVien(danhSachSinhVien),
      ],
    );
  }

  void _themSinhVien(SinhVien sinhVien) {
    setState(() {
      danhSachSinhVien.add(sinhVien);
    });
  }
}
