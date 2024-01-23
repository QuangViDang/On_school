import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_format/date_format.dart';

import '/../../models/sinhvien.dart';

class FormNhapSinhVien extends StatefulWidget {
  final void Function(SinhVien) onThemSinhVien;

  FormNhapSinhVien({required this.onThemSinhVien});

  @override
  _FormNhapSinhVienState createState() => _FormNhapSinhVienState();
}

class _FormNhapSinhVienState extends State<FormNhapSinhVien> {
  final maController = TextEditingController();
  final hoVaTenController = TextEditingController();
  late DateTime selectedDate; // Thêm biến để lưu ngày được chọn
  final diemTotNghiepController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    ))!;

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Student Code'),
              controller: maController,
              style: GoogleFonts.notoSans(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Student Name'),
              controller: hoVaTenController,
              style: GoogleFonts.notoSans(),
            ),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Student Date of Birth',
                  ),
                  controller: TextEditingController(
                    text: formatDate(
                      selectedDate,
                      [yyyy, '-', mm, '-', dd],
                    ),
                  ),
                  style: GoogleFonts.notoSans(),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Graduation'),
              controller: diemTotNghiepController,
              style: GoogleFonts.notoSans(),
            ),
            TextButton(
              child: Text('Thêm sinh viên'),
              onPressed: () {
                // Tạo đối tượng SinhVien từ dữ liệu nhập
                SinhVien sinhVien = SinhVien(
                  ma: int.parse(maController.text),
                  hoVaTen: hoVaTenController.text,
                  ngaySinh: selectedDate,
                  diemTotNghiep: double.parse(diemTotNghiepController.text),
                  // Thêm các trường khác tùy ý
                );

                // Gọi callback để thông báo về QuanLySinhVien
                widget.onThemSinhVien(sinhVien);

                // Xóa dữ liệu nhập
                maController.clear();
                hoVaTenController.clear();
                diemTotNghiepController.clear();
              },
            )
          ],
        ),
      ),
    );
  }
}
