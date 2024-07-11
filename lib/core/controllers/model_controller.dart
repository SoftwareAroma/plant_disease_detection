import 'dart:io';

import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:plant_disease_detection/index.dart';

class ModelController extends GetxController {
  static ModelController instance = Get.find();
  final _predictionModel = Rxn<PredictionModel>();
  final ImagePicker imagePicker = ImagePicker();
  final _firebaseCustomModel = Rxn<FirebaseCustomModel>();
  final _pickedFile = Rxn<File>();

  final _usePicture = false.obs;
  final _isDetecting = false.obs;
  final _isPictureReady = false.obs;
  final _streamImage = false.obs;

  /// Select image using an [ImageSource] passed with other configs
  pickImage(ImageSource source, {double? maxWidth, double? maxHeight, int? quality}) async {
    try {
      final XFile? pickedFile = await imagePicker.pickImage(
        source: source,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: quality,
      );
      _pickedFile.value = File(pickedFile!.path);
      _isPictureReady.value = true;
      _isDetecting.value = true;
      if (_pickedFile.value != null) {
        await predict(file: File(_pickedFile.value!.path));
      } else {
        _isPictureReady.value = false;
        _isDetecting.value = false;
      }
    } catch (e) {
      debugPrint("Error picking image $e");
    }
    update();
  }

  updateIsPictureReady({required bool value}) {
    _isPictureReady.value = value;
    update();
  }

  updateIsDetectingReady({required bool value}) {
    _isDetecting.value = value;
    update();
  }

  updateUsePicture({required bool value}) {
    _usePicture.value = value;
    update();
  }

  updateStreamImage({required bool value}) {
    _streamImage.value = value;
    update();
  }

  /// Predict the class of disease using the passed [File]
  Future<void> predict({required File file}) async {
    try {
      /// Initialize the TFLite model.
      String? loadModel = await Tflite.loadModel(
        model: Assets.modelInceptionModel,
        labels: Assets.modelLabelsText,
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false,
      );
      debugPrint("loaded Model >>>>>>>>>>>>>> $loadModel");

      /// Run the model on the preprocessed data.
      final output = await Tflite.runModelOnImage(
        path: file.path,
        numResults: 1,
        imageMean: 0.0,
        imageStd: 255.0,
        threshold: 0.2,
        asynch: true,
      );
      // debugPrint("Model output: ${output![0]}");
      var outputData = output![0];

      /// Process the model output.
      processModelOutput(outputData);
    } catch (error) {
      debugPrint("Model error: $error");
    }
    update();
  }

  Future<void> initFirebaseLocalModel() async {
    FirebaseModelDownloader.instance
        .getModel(
      kFirebaseModelName,
      FirebaseModelDownloadType.localModel,
      FirebaseModelDownloadConditions(
        iosAllowsCellularAccess: true,
        iosAllowsBackgroundDownloading: true,
        androidChargingRequired: false,
        androidWifiRequired: false,
        androidDeviceIdleRequired: false,
      ),
    )
        .then((FirebaseCustomModel customModel) {
      _firebaseCustomModel.value = customModel;
      final localModelPath = customModel.file;
      debugPrint("downloaded $localModelPath");
    });
    update();
  }

  /// Process the output of the prediction model
  void processModelOutput(Map<dynamic, dynamic> output) {
    // Process the model output as needed
    debugPrint('${output['label']}: ${output['confidence']}');
    String confidence = (double.parse(output['confidence'].toString()) * 100).toStringAsFixed(2).replaceAll(RegExp(r'\.0+$'), '');
    // debugPrint("confidence score $confidence");
    _predictionModel.value = PredictionModel(
      prediction: output['label'].toString(),
      confidence: confidence.toString(),
    );
    _isDetecting.value = false;
    update();
  }

  /// Close the [Tflite] model
  closeModel() {
    Tflite.close();
    update();
  }

  /// reset the entire controller
  reset() {
    _isPictureReady.value = false;
    _isDetecting.value = false;
    _usePicture.value = false;
    _predictionModel.value = null;
    _pickedFile.value = null;
    Tflite.close();
    update();
  }

  /// load an [Image] from file
  Future<File> loadImageAsFile(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    final Uint8List byteList = byteData.buffer.asUint8List();
    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/${DateTime.now().millisecond}.png';
    await File(tempPath).writeAsBytes(byteList);
    return File(tempPath);
  }

  /// test the model
  Future<void> testModel() async {
    File file = await loadImageAsFile(Assets.modelTestImage);
    // debugPrint("test image ${file.path}");
    await predict(file: file);
    update();
  }

  Future<void> flagImage() async {
    /// upload the image if the user is connected to the internet and if not save it for later upload when the user is connected.
    // if (await ConnectivityService.instance.checkIfConnected()) {
    //   /// upload the image
    //   await FirebaseStorageService.instance.uploadImage(
    //     file: _pickedFile.value!,
    //     folderName: FirebaseStorageService.instance.folderName,
    //     fileName: FirebaseStorageService.instance.fileName,
    //   );
    // } else {
    //   /// save the image for later upload
    //   await FirebaseStorageService.instance.saveImage(
    //     file: _pickedFile.value!,
    //     folderName: FirebaseStorageService.instance.folderName,
    //     fileName: FirebaseStorageService.instance.fileName,
    //   );
    // }
    update();
  }

  /// getters
  PredictionModel? get predictionModel => _predictionModel.value;
  bool get usePicture => _usePicture.value;
  File? get pickedFile => _pickedFile.value;
  bool get isDetecting => _isDetecting.value;
  bool get isPictureReady => _isPictureReady.value;
  bool get streamImage => _streamImage.value;
}
