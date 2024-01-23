import 'package:flutter/material.dart';
import 'package:moneymanager/orderfood/orderfood_view.dart';
import 'widgets/location/location_view.dart';
import 'widgets/qldt/quanly_sinhvien.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PKA',
      navigatorKey: navigatorKey,
      navigatorObservers: [HeroController()],
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.message, 'MESSAGE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Phenikaa University was established on 10 October 2007, and became a member of Phenikaa Group - Vietnam’s leading industrial corporation - in 2017. \nPhenikaa University strives to become a multidisciplinary university par excellence in research, academic, and career development based on international standards in training, scientific research, and university governance.',
        textAlign: TextAlign.justify,
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'PKA',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PKA'),
        ),
        body: ListView(
          children: [
            Image.asset(
              './images/phenikaaLogo.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                // Chuyển đến trang thời tiết khi nhấn nút
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GeolocatorExample()),
                );
              },
              child: Icon(Icons.location_on),
            ),
            FloatingActionButton(
              onPressed: () {
                // Chuyển đến trang thời tiết khi nhấn nút
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuanLySinhVien()),
                );
              },
              child: Icon(Icons.location_city),
            ),
            FloatingActionButton(
              onPressed: () {
                // Chuyển đến trang thời tiết khi nhấn nút
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderFood()),
                );
              },
              child: Icon(Icons.food_bank),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Phenikaa University',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Ha Noi, Viet Nam',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      const Text('11299'),
    ],
  ),
);
