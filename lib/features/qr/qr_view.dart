import 'dart:async';
import 'dart:io';

import 'package:citiquiz/features/qr/bloc/qr_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrViewScreeen extends StatefulWidget {
  const QrViewScreeen({Key? key}) : super(key: key);

  @override
  State<QrViewScreeen> createState() => _QrViewScreeenState();
}

class _QrViewScreeenState extends State<QrViewScreeen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool _isResultShown = false; // Флаг для отслеживания показа модального окна

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QrBloc, QrState>(
      listener: (context, state) {
        // Navigator.of(context).pop();
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: (result != null)
                    ? Text(
                        'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                    : Text('Scan a code'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    StreamSubscription<Barcode> sub =
        controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result != null && !_isResultShown) {
          _isResultShown = true; // Устанавливаем флаг в true после показа окна
          _showResultModal(result!.code ?? "---");
        }
      });
    });
  }

  void _showResultModal(String data) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'РЕЗУЛЬТАТ СКАНИРОВАНИЯ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(
                  data,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
