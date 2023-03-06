import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CodeReception extends StatefulWidget {
  const CodeReception({super.key, required this.title});

  final String title;

  @override
  State<CodeReception> createState() => _CodeReceptionState();
}

class _CodeReceptionState extends State<CodeReception> {
  final GlobalKey _key = GlobalKey();
  QRViewController? _qrcontroller;
  Barcode? _scannedCode;
  void getQR(QRViewController _qrcontroller){
    this._qrcontroller = _qrcontroller;
    _qrcontroller.scannedDataStream.listen((event) {
      setState(() {
        _scannedCode = event;
      });
    });
  }

  String _data = "";
  final String _hash = DateTime.now().toString().hashCode.toString();
  String keep = "";
  int one = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text("QR Code")),
      body: Column(
        children: [
          if (one == 1 )
            Center(
              child: QrImage(
                data: _data,
                version: QrVersions.auto,
                size: 370,
              ),
            ),
          if (one == 2 )
            SizedBox(
              height: 370,
              width: 370,
              child: QRView(
                key: _key,
                onQRViewCreated: getQR,
              ),
            ),
          Center(
            //Change _scannedCode!.code to a link to the group
            child: (_scannedCode != null) ? Text('${_scannedCode!.code}') : const Text(""),
          ),
          TextButton(onPressed: (){

            setState(() {
              _data = "GM${Random().nextInt(10)}${Random().nextInt(10)}${Random().nextInt(10)}$_hash";
              keep = _data;
              one = 1;
            });
          },child : const Align(
              alignment: Alignment.topRight,
              child:
              Text("Get QR Code",
                  textAlign: TextAlign.center
              )
          )),
          TextButton(onPressed: () async{
            setState(() {
              one = 2;
            });
          }, child: const Align(
              alignment: Alignment.topLeft,
              child:
              Text("Scan QR Code"))
          )],
      ),
    ));
  }
}