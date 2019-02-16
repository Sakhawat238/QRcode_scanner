import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String barcode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR code scanner'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: RaisedButton(
                color: Colors.blueAccent,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                child: Text('Start Camera Scan'),
                onPressed: scan,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
              child: Text(
                barcode,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future scan() async {
    try{
      String barcode = await QRCodeReader().scan();
      setState(() {
        this.barcode = "Result: $barcode";
      });
    } catch (e) {
      setState(() {
        this.barcode = 'Error: $e';
      });
    }
  }
}
