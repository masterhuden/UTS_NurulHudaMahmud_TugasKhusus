import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double height, weight, result;
  String status;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Penghitung IMT',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi Penghitung IMT'),
          backgroundColor: Colors.grey,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Masukkan Tinggi Anda (dalam cm)',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 1,
              ),
              TextField(
                onChanged: (value) {
                  height = double.parse(value) / 100;
                },
              ),
              Text(
                '\n\n\nMasukkan Berat badan Anda (dalam Kg)',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                onChanged: (value) {
                  weight = double.parse(value);
                },
              ),
              FlatButton(
                color: Colors.blueGrey,
                child: Text(
                  'Hitung',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    result = weight / (height * height);
                    if (result < 18.5) {
                      status = "Anda Kurus";
                    } else if (result < 25) {
                      status = "Berat Badan Anda Normal";
                    } else if (result < 30) {
                      status = "Anda Gemuk";
                    } else if (result < 35) {
                      status = "Anda Obesitas Kelas 1";
                    } else if (result < 40) {
                      status = "Anda Obesitas Kelas 2";
                    } else {
                      status = "Anda Obesitas Kelas 3";
                    }
                  });
                },
              ),
              Text(
                "\n\n\nHasil            = ${result.toString()}\nKeterangan =$status",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
