import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_disease_detection/index.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const MethodChannel pytorchChannel = MethodChannel('com.pytorch_channel');

  @override
  void initState() {
    super.initState();
    _gettingModelFile().then((void value) => logger.d('File Created Successfully'));
  }

  String? prediction;

  Future<void> _gettingModelFile() async {
    const String detectionModel = Assets.detectionDetectionModel;
    final ByteData data = await rootBundle.load(Assets.detectionDetectionModel);

    final List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    if (!File(detectionModel).existsSync()) {
      await File(detectionModel).writeAsBytes(bytes);
    }
  }

  Future<void> getPrediction() async {
    final ByteData imageData = await rootBundle.load(Assets.imagesCornOnTheCob);
    try {
      final String result = await pytorchChannel.invokeMethod(
        'predict_image',
        <String, dynamic>{
          'model_path': Assets.detectionDetectionModel,
          'image_data': imageData.buffer.asUint8List(imageData.offsetInBytes, imageData.lengthInBytes),
          'data_offset': imageData.offsetInBytes,
          'data_length': imageData.lengthInBytes
        },
      );
      setState(() {
        prediction = result;
      });
    } on PlatformException catch (e) {
      logger.e("Failed to get prediction: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pytorch Mobile'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 300,
                    child: Image.asset(Assets.imagesCornOnTheCob),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    (prediction ?? '').toUpperCase(),
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _getPrediction,
      //   tooltip: 'Predict Image',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
