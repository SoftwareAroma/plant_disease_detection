import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plant_disease_detection/index.dart';

class RecommendationController extends GetxController {
  static RecommendationController get instance => Get.find();

  /// Languages section
  ///
  /// anything to do with language and translation

  static final List<String> _languages = [
    'English',
    'Asante',
    'Akuapem',
    'Ewe',
    'Hausa',
  ];

  final _activeLanguage = _languages[0].obs;

  /// change the active language to a value supplied
  changeActiveLanguage(String language) {
    _activeLanguage.value = language;
    // translate(destLang: language);
    update();
  }

  /// change the active language to English which is the default language
  changeLangEng() {
    _activeLanguage.value = _languages[0];
    update();
  }

  /// Recommendations Section
  ///
  /// anything to do with recommendations

  /// all recommendations for english
  final _allRecommendations = <DiseaseModel>[].obs;
  final _tomatoRecommendations = <DiseaseModel>[].obs;
  final _cornRecommendations = <DiseaseModel>[].obs;
  final _pepperRecommendations = <DiseaseModel>[].obs;

  /// all recommendations for asante
  final _allAsanteRecommendations = <DiseaseModel>[].obs;
  final _tomatoAsanteRecommendations = <DiseaseModel>[].obs;
  final _cornAsanteRecommendations = <DiseaseModel>[].obs;
  final _pepperAsanteRecommendations = <DiseaseModel>[].obs;

  /// all recommendations for akuapem
  final _allAkuapemRecommendations = <DiseaseModel>[].obs;
  final _tomatoAkuapemRecommendations = <DiseaseModel>[].obs;
  final _cornAkuapemRecommendations = <DiseaseModel>[].obs;
  final _pepperAkuapemRecommendations = <DiseaseModel>[].obs;

  /// all recommendations for ewe
  final _allEweRecommendations = <DiseaseModel>[].obs;
  final _tomatoEweRecommendations = <DiseaseModel>[].obs;
  final _cornEweRecommendations = <DiseaseModel>[].obs;
  final _pepperEweRecommendations = <DiseaseModel>[].obs;

  /// all recommendations for hausa
  final _allHausaRecommendations = <DiseaseModel>[].obs;
  final _tomatoHausaRecommendations = <DiseaseModel>[].obs;
  final _cornHausaRecommendations = <DiseaseModel>[].obs;
  final _pepperHausaRecommendations = <DiseaseModel>[].obs;

  /// active recommendation [DiseaseModel]
  final _activeRecommendation = Rxn<DiseaseModel>();

  /// The individual translated recommendations [DiseaseModel]
  final _activeEnglishRecommendation = Rxn<DiseaseModel>();
  final _activeAsanteRecommendation = Rxn<DiseaseModel>();
  final _activeAkuapemRecommendation = Rxn<DiseaseModel>();
  final _activeEweRecommendation = Rxn<DiseaseModel>();
  final _activeHausaRecommendation = Rxn<DiseaseModel>();

  final _activeCrop = "".obs;
  final _activeDiseaseName = "".obs;

  changeActiveCropAndDisease({
    required String crop,
    required String disease,
  }) {
    _activeCrop.value = crop;
    _activeDiseaseName.value = disease;
    update();
  }

  /// for any [DiseaseModel] that is unknown to the solution
  /// alert the user that the disease is unknown
  final _unknownDisease = DiseaseModel(
    disease: "Unknown",
    causes: ["Unknown"],
    preventions: ["Unknown"],
    recommendations: RecommendationModel.fromJson({
      "organic": ["Unknown"],
      "chemical": ["Unknown"]
    }),
  ).obs;

  /// Recommendation state section
  ///
  /// set the active recommendation to the value supplied
  _setActiveRecommendation(DiseaseModel value) {
    _activeRecommendation.value = value;
    // debugPrint("active recommendation >>>>> ${_activeRecommendation.value}");
    update();
  }

  /**
   * look at the target language and select the appropriate crop model
   * then get the disease from the crop model
   * ['English', 'Asante', 'Akuapem', 'Ewe', 'Hausa'];
   *
   * */
  /// activate the active language model recommendation
  translate() async {
    if (_activeDiseaseName.value == "") return;
    return getRecommendation(
      disease: _activeDiseaseName.value,
      crop: _activeCrop.value,
    );
  }

  Future<dynamic> _readJson(recommendation) async {
    final String response = await rootBundle.loadString(recommendation);
    final data = await json.decode(response);
    return data;
  }

  /// Load all the [RecommendationModel] for the [DiseaseModel]
  /// we target three crops [CropModel]
  /// the crops are maize, pepper, and tomato
  Future<void> loadRecommendations() async {
    final data = await _readJson(Assets.modelRecommendations);

    var maizeList = data['maize']?.toList();
    var tomatoList = data['tomato']?.toList();
    var pepperList = data['pepper']?.toList();

    /// all corn recommendations
    maizeList?.forEach((element) {
      String diseaseName = (element['disease'] as String?) ?? '';
      List<dynamic> causes = (element['causes'] as List<dynamic>);
      Map<String, dynamic>? recommendations = element['recommendations'] as Map<String, dynamic>?;
      List<dynamic> organicRecommendations = (recommendations?['organic'] as List<dynamic>?) ?? [];
      List<dynamic> chemicalRecommendations = (recommendations?['chemical'] as List<dynamic>?) ?? [];
      List<dynamic> preventiveMeasures = (element['preventive_measures'] as List<dynamic>?) ?? [];
      Map<String, dynamic> jsonRecs = {"organic": organicRecommendations, "chemical": chemicalRecommendations};
      RecommendationModel recommendationModel = RecommendationModel.fromJson(jsonRecs);
      Map<String, dynamic> jsonDiseases = {
        "disease": diseaseName,
        "causes": causes,
        "preventions": preventiveMeasures,
        "recommendations": recommendationModel.toJson(),
      };
      DiseaseModel diseaseModel = DiseaseModel.fromJson(jsonDiseases);
      // debugPrint("disease $diseaseModel");
      _cornRecommendations.add(diseaseModel);
      _allRecommendations.add(diseaseModel);
    });

    /// all tomato recommendations
    tomatoList?.forEach((element) {
      String diseaseName = (element['disease'] as String?) ?? '';
      List<dynamic> causes = (element['causes'] as List<dynamic>);
      Map<String, dynamic>? recommendations = element['recommendations'] as Map<String, dynamic>?;
      List<dynamic> organicRecommendations = (recommendations?['organic'] as List<dynamic>?) ?? [];
      List<dynamic> chemicalRecommendations = (recommendations?['chemical'] as List<dynamic>?) ?? [];
      List<dynamic> preventiveMeasures = (element['preventive_measures'] as List<dynamic>?) ?? [];
      Map<String, dynamic> jsonRecs = {"organic": organicRecommendations, "chemical": chemicalRecommendations};
      RecommendationModel recommendationModel = RecommendationModel.fromJson(jsonRecs);
      Map<String, dynamic> jsonDiseases = {
        "disease": diseaseName,
        "causes": causes,
        "preventions": preventiveMeasures,
        "recommendations": recommendationModel.toJson(),
      };
      DiseaseModel diseaseModel = DiseaseModel.fromJson(jsonDiseases);
      _tomatoRecommendations.add(diseaseModel);
      _allRecommendations.add(diseaseModel);
    });

    /// all pepper recommendations
    pepperList?.forEach((element) {
      String diseaseName = (element['disease'] as String?) ?? '';
      List<dynamic> causes = (element['causes'] as List<dynamic>);
      Map<String, dynamic>? recommendations = element['recommendations'] as Map<String, dynamic>?;
      List<dynamic> organicRecommendations = (recommendations?['organic'] as List<dynamic>?) ?? [];
      List<dynamic> chemicalRecommendations = (recommendations?['chemical'] as List<dynamic>?) ?? [];
      List<dynamic> preventiveMeasures = (element['preventive_measures'] as List<dynamic>?) ?? [];
      Map<String, dynamic> jsonRecs = {"organic": organicRecommendations, "chemical": chemicalRecommendations};
      RecommendationModel recommendationModel = RecommendationModel.fromJson(jsonRecs);
      Map<String, dynamic> jsonDiseases = {
        "disease": diseaseName,
        "causes": causes,
        "preventions": preventiveMeasures,
        "recommendations": recommendationModel.toJson(),
      };
      DiseaseModel diseaseModel = DiseaseModel.fromJson(jsonDiseases);
      _pepperRecommendations.add(diseaseModel);
      _allRecommendations.add(diseaseModel);
    });
    // debugPrint("Tomato data: $tomatoModel");
    update();
  }

  /// Load all the [RecommendationModel] for the [DiseaseModel] for Asante
  Future<void> loadAsanteRecommendations() async {
    final data = await _readJson(Assets.modelRecommendationsAsanteTwi);

    var maizeList = data['maize']?.toList();
    var tomatoList = data['tomato']?.toList();
    var pepperList = data['pepper']?.toList();

    /// all corn recommendations
    maizeList?.forEach((element) {
      String diseaseName = (element['disease'] as String?) ?? '';
      List<dynamic> causes = (element['causes'] as List<dynamic>);
      Map<String, dynamic>? recommendations = element['recommendations'] as Map<String, dynamic>?;
      List<dynamic> organicRecommendations = (recommendations?['organic'] as List<dynamic>?) ?? [];
      List<dynamic> chemicalRecommendations = (recommendations?['chemical'] as List<dynamic>?) ?? [];
      List<dynamic> preventiveMeasures = (element['preventive_measures'] as List<dynamic>?) ?? [];
      Map<String, dynamic> jsonRecs = {"organic": organicRecommendations, "chemical": chemicalRecommendations};
      RecommendationModel recommendationModel = RecommendationModel.fromJson(jsonRecs);
      Map<String, dynamic> jsonDiseases = {
        "disease": diseaseName,
        "causes": causes,
        "preventions": preventiveMeasures,
        "recommendations": recommendationModel.toJson(),
      };
      DiseaseModel diseaseModel = DiseaseModel.fromJson(jsonDiseases);
      // debugPrint("disease $diseaseModel");
      _cornAsanteRecommendations.add(diseaseModel);
      _allAsanteRecommendations.add(diseaseModel);
    });

    /// all tomato recommendations
    tomatoList?.forEach((element) {
      String diseaseName = (element['disease'] as String?) ?? '';
      List<dynamic> causes = (element['causes'] as List<dynamic>);
      Map<String, dynamic>? recommendations = element['recommendations'] as Map<String, dynamic>?;
      List<dynamic> organicRecommendations = (recommendations?['organic'] as List<dynamic>?) ?? [];
      List<dynamic> chemicalRecommendations = (recommendations?['chemical'] as List<dynamic>?) ?? [];
      List<dynamic> preventiveMeasures = (element['preventive_measures'] as List<dynamic>?) ?? [];
      Map<String, dynamic> jsonRecs = {"organic": organicRecommendations, "chemical": chemicalRecommendations};
      RecommendationModel recommendationModel = RecommendationModel.fromJson(jsonRecs);
      Map<String, dynamic> jsonDiseases = {
        "disease": diseaseName,
        "causes": causes,
        "preventions": preventiveMeasures,
        "recommendations": recommendationModel.toJson(),
      };
      DiseaseModel diseaseModel = DiseaseModel.fromJson(jsonDiseases);
      _tomatoAsanteRecommendations.add(diseaseModel);
      _allAsanteRecommendations.add(diseaseModel);
    });

    /// all pepper recommendations
    pepperList?.forEach((element) {
      String diseaseName = (element['disease'] as String?) ?? '';
      List<dynamic> causes = (element['causes'] as List<dynamic>);
      Map<String, dynamic>? recommendations = element['recommendations'] as Map<String, dynamic>?;
      List<dynamic> organicRecommendations = (recommendations?['organic'] as List<dynamic>?) ?? [];
      List<dynamic> chemicalRecommendations = (recommendations?['chemical'] as List<dynamic>?) ?? [];
      List<dynamic> preventiveMeasures = (element['preventive_measures'] as List<dynamic>?) ?? [];
      Map<String, dynamic> jsonRecs = {"organic": organicRecommendations, "chemical": chemicalRecommendations};
      RecommendationModel recommendationModel = RecommendationModel.fromJson(jsonRecs);
      Map<String, dynamic> jsonDiseases = {
        "disease": diseaseName,
        "causes": causes,
        "preventions": preventiveMeasures,
        "recommendations": recommendationModel.toJson(),
      };
      DiseaseModel diseaseModel = DiseaseModel.fromJson(jsonDiseases);
      _pepperAsanteRecommendations.add(diseaseModel);
      _allAsanteRecommendations.add(diseaseModel);
    });
    // debugPrint("Tomato data: $tomatoModel");
    update();
  }

  /// Load all the [RecommendationModel] for the [DiseaseModel] for Akuapem
  Future<void> loadAkuapemRecommendations() async {
    final data = await _readJson(Assets.modelRecommendationsAkuapemTwi);

    var maizeList = data['maize']?.toList();
    var tomatoList = data['tomato']?.toList();
    var pepperList = data['pepper']?.toList();

    /// all corn recommendations
    maizeList?.forEach((element) {
      String diseaseName = (element['disease'] as String?) ?? '';
      List<dynamic> causes = (element['causes'] as List<dynamic>);
      Map<String, dynamic>? recommendations = element['recommendations'] as Map<String, dynamic>?;
      List<dynamic> organicRecommendations = (recommendations?['organic'] as List<dynamic>?) ?? [];
      List<dynamic> chemicalRecommendations = (recommendations?['chemical'] as List<dynamic>?) ?? [];
      List<dynamic> preventiveMeasures = (element['preventive_measures'] as List<dynamic>?) ?? [];
      Map<String, dynamic> jsonRecs = {"organic": organicRecommendations, "chemical": chemicalRecommendations};
      RecommendationModel recommendationModel = RecommendationModel.fromJson(jsonRecs);
      Map<String, dynamic> jsonDiseases = {
        "disease": diseaseName,
        "causes": causes,
        "preventions": preventiveMeasures,
        "recommendations": recommendationModel.toJson(),
      };
      DiseaseModel diseaseModel = DiseaseModel.fromJson(jsonDiseases);
      // debugPrint("disease $diseaseModel");
      _cornAkuapemRecommendations.add(diseaseModel);
      _allAkuapemRecommendations.add(diseaseModel);
    });

    /// all tomato recommendations
    tomatoList?.forEach((element) {
      String diseaseName = (element['disease'] as String?) ?? '';
      List<dynamic> causes = (element['causes'] as List<dynamic>);
      Map<String, dynamic>? recommendations = element['recommendations'] as Map<String, dynamic>?;
      List<dynamic> organicRecommendations = (recommendations?['organic'] as List<dynamic>?) ?? [];
      List<dynamic> chemicalRecommendations = (recommendations?['chemical'] as List<dynamic>?) ?? [];
      List<dynamic> preventiveMeasures = (element['preventive_measures'] as List<dynamic>?) ?? [];
      Map<String, dynamic> jsonRecs = {"organic": organicRecommendations, "chemical": chemicalRecommendations};
      RecommendationModel recommendationModel = RecommendationModel.fromJson(jsonRecs);
      Map<String, dynamic> jsonDiseases = {
        "disease": diseaseName,
        "causes": causes,
        "preventions": preventiveMeasures,
        "recommendations": recommendationModel.toJson(),
      };
      DiseaseModel diseaseModel = DiseaseModel.fromJson(jsonDiseases);
      _tomatoAkuapemRecommendations.add(diseaseModel);
      _allAkuapemRecommendations.add(diseaseModel);
    });

    /// all pepper recommendations
    pepperList?.forEach((element) {
      String diseaseName = (element['disease'] as String?) ?? '';
      List<dynamic> causes = (element['causes'] as List<dynamic>);
      Map<String, dynamic>? recommendations = element['recommendations'] as Map<String, dynamic>?;
      List<dynamic> organicRecommendations = (recommendations?['organic'] as List<dynamic>?) ?? [];
      List<dynamic> chemicalRecommendations = (recommendations?['chemical'] as List<dynamic>?) ?? [];
      List<dynamic> preventiveMeasures = (element['preventive_measures'] as List<dynamic>?) ?? [];
      Map<String, dynamic> jsonRecs = {"organic": organicRecommendations, "chemical": chemicalRecommendations};
      RecommendationModel recommendationModel = RecommendationModel.fromJson(jsonRecs);
      Map<String, dynamic> jsonDiseases = {
        "disease": diseaseName,
        "causes": causes,
        "preventions": preventiveMeasures,
        "recommendations": recommendationModel.toJson(),
      };
      DiseaseModel diseaseModel = DiseaseModel.fromJson(jsonDiseases);
      _pepperAkuapemRecommendations.add(diseaseModel);
      _allAkuapemRecommendations.add(diseaseModel);
    });
    // debugPrint("Tomato data: $tomatoModel");
    update();
  }

  /// Load all the [RecommendationModel] for the [DiseaseModel] for Ewe
  Future<void> loadEweRecommendations() async {
    final data = await _readJson(Assets.modelRecommendationsEwe);

    var maizeList = data['maize']?.toList();
    var tomatoList = data['tomato']?.toList();
    var pepperList = data['pepper']?.toList();

    /// all corn recommendations
    maizeList?.forEach((element) {
      String diseaseName = (element['disease'] as String?) ?? '';
      List<dynamic> causes = (element['causes'] as List<dynamic>);
      Map<String, dynamic>? recommendations = element['recommendations'] as Map<String, dynamic>?;
      List<dynamic> organicRecommendations = (recommendations?['organic'] as List<dynamic>?) ?? [];
      List<dynamic> chemicalRecommendations = (recommendations?['chemical'] as List<dynamic>?) ?? [];
      List<dynamic> preventiveMeasures = (element['preventive_measures'] as List<dynamic>?) ?? [];
      Map<String, dynamic> jsonRecs = {"organic": organicRecommendations, "chemical": chemicalRecommendations};
      RecommendationModel recommendationModel = RecommendationModel.fromJson(jsonRecs);
      Map<String, dynamic> jsonDiseases = {
        "disease": diseaseName,
        "causes": causes,
        "preventions": preventiveMeasures,
        "recommendations": recommendationModel.toJson(),
      };
      DiseaseModel diseaseModel = DiseaseModel.fromJson(jsonDiseases);
      // debugPrint("disease $diseaseModel");
      _cornEweRecommendations.add(diseaseModel);
      _allEweRecommendations.add(diseaseModel);
    });

    /// all tomato recommendations
    tomatoList?.forEach((element) {
      String diseaseName = (element['disease'] as String?) ?? '';
      List<dynamic> causes = (element['causes'] as List<dynamic>);
      Map<String, dynamic>? recommendations = element['recommendations'] as Map<String, dynamic>?;
      List<dynamic> organicRecommendations = (recommendations?['organic'] as List<dynamic>?) ?? [];
      List<dynamic> chemicalRecommendations = (recommendations?['chemical'] as List<dynamic>?) ?? [];
      List<dynamic> preventiveMeasures = (element['preventive_measures'] as List<dynamic>?) ?? [];
      Map<String, dynamic> jsonRecs = {"organic": organicRecommendations, "chemical": chemicalRecommendations};
      RecommendationModel recommendationModel = RecommendationModel.fromJson(jsonRecs);
      Map<String, dynamic> jsonDiseases = {
        "disease": diseaseName,
        "causes": causes,
        "preventions": preventiveMeasures,
        "recommendations": recommendationModel.toJson(),
      };
      DiseaseModel diseaseModel = DiseaseModel.fromJson(jsonDiseases);
      _tomatoEweRecommendations.add(diseaseModel);
      _allEweRecommendations.add(diseaseModel);
    });

    /// all pepper recommendations
    pepperList?.forEach((element) {
      String diseaseName = (element['disease'] as String?) ?? '';
      List<dynamic> causes = (element['causes'] as List<dynamic>);
      Map<String, dynamic>? recommendations = element['recommendations'] as Map<String, dynamic>?;
      List<dynamic> organicRecommendations = (recommendations?['organic'] as List<dynamic>?) ?? [];
      List<dynamic> chemicalRecommendations = (recommendations?['chemical'] as List<dynamic>?) ?? [];
      List<dynamic> preventiveMeasures = (element['preventive_measures'] as List<dynamic>?) ?? [];
      Map<String, dynamic> jsonRecs = {"organic": organicRecommendations, "chemical": chemicalRecommendations};
      RecommendationModel recommendationModel = RecommendationModel.fromJson(jsonRecs);
      Map<String, dynamic> jsonDiseases = {
        "disease": diseaseName,
        "causes": causes,
        "preventions": preventiveMeasures,
        "recommendations": recommendationModel.toJson(),
      };
      DiseaseModel diseaseModel = DiseaseModel.fromJson(jsonDiseases);
      _pepperEweRecommendations.add(diseaseModel);
      _allEweRecommendations.add(diseaseModel);
    });
    // debugPrint("Tomato data: $tomatoModel");
    update();
  }

  /// Load all the [RecommendationModel] for the [DiseaseModel] for Hausa
  Future<void> loadHausaRecommendations() async {
    final data = await _readJson(Assets.modelRecommendationsHausa);

    var maizeList = data['maize']?.toList();
    var tomatoList = data['tomato']?.toList();
    var pepperList = data['pepper']?.toList();

    /// all corn recommendations
    maizeList?.forEach((element) {
      String diseaseName = (element['disease'] as String?) ?? '';
      List<dynamic> causes = (element['causes'] as List<dynamic>);
      Map<String, dynamic>? recommendations = element['recommendations'] as Map<String, dynamic>?;
      List<dynamic> organicRecommendations = (recommendations?['organic'] as List<dynamic>?) ?? [];
      List<dynamic> chemicalRecommendations = (recommendations?['chemical'] as List<dynamic>?) ?? [];
      List<dynamic> preventiveMeasures = (element['preventive_measures'] as List<dynamic>?) ?? [];
      Map<String, dynamic> jsonRecs = {"organic": organicRecommendations, "chemical": chemicalRecommendations};
      RecommendationModel recommendationModel = RecommendationModel.fromJson(jsonRecs);
      Map<String, dynamic> jsonDiseases = {
        "disease": diseaseName,
        "causes": causes,
        "preventions": preventiveMeasures,
        "recommendations": recommendationModel.toJson(),
      };
      DiseaseModel diseaseModel = DiseaseModel.fromJson(jsonDiseases);
      // debugPrint("disease $diseaseModel");
      _cornHausaRecommendations.add(diseaseModel);
      _allHausaRecommendations.add(diseaseModel);
    });

    /// all tomato recommendations
    tomatoList?.forEach((element) {
      String diseaseName = (element['disease'] as String?) ?? '';
      List<dynamic> causes = (element['causes'] as List<dynamic>);
      Map<String, dynamic>? recommendations = element['recommendations'] as Map<String, dynamic>?;
      List<dynamic> organicRecommendations = (recommendations?['organic'] as List<dynamic>?) ?? [];
      List<dynamic> chemicalRecommendations = (recommendations?['chemical'] as List<dynamic>?) ?? [];
      List<dynamic> preventiveMeasures = (element['preventive_measures'] as List<dynamic>?) ?? [];
      Map<String, dynamic> jsonRecs = {"organic": organicRecommendations, "chemical": chemicalRecommendations};
      RecommendationModel recommendationModel = RecommendationModel.fromJson(jsonRecs);
      Map<String, dynamic> jsonDiseases = {
        "disease": diseaseName,
        "causes": causes,
        "preventions": preventiveMeasures,
        "recommendations": recommendationModel.toJson(),
      };
      DiseaseModel diseaseModel = DiseaseModel.fromJson(jsonDiseases);
      _tomatoHausaRecommendations.add(diseaseModel);
      _allHausaRecommendations.add(diseaseModel);
    });

    /// all pepper recommendations
    pepperList?.forEach((element) {
      String diseaseName = (element['disease'] as String?) ?? '';
      List<dynamic> causes = (element['causes'] as List<dynamic>);
      Map<String, dynamic>? recommendations = element['recommendations'] as Map<String, dynamic>?;
      List<dynamic> organicRecommendations = (recommendations?['organic'] as List<dynamic>?) ?? [];
      List<dynamic> chemicalRecommendations = (recommendations?['chemical'] as List<dynamic>?) ?? [];
      List<dynamic> preventiveMeasures = (element['preventive_measures'] as List<dynamic>?) ?? [];
      Map<String, dynamic> jsonRecs = {"organic": organicRecommendations, "chemical": chemicalRecommendations};
      RecommendationModel recommendationModel = RecommendationModel.fromJson(jsonRecs);
      Map<String, dynamic> jsonDiseases = {
        "disease": diseaseName,
        "causes": causes,
        "preventions": preventiveMeasures,
        "recommendations": recommendationModel.toJson(),
      };
      DiseaseModel diseaseModel = DiseaseModel.fromJson(jsonDiseases);
      _pepperHausaRecommendations.add(diseaseModel);
      _allHausaRecommendations.add(diseaseModel);
    });
    // debugPrint("Tomato data: $tomatoModel");
    update();
  }

  /// Get the [RecommendationModel] for the active language
  /// get the [RecommendationModel] when a disease is supplied
  /// this method also takes a crop as an argument to reduce the processing time
  /// in the case where no crop is supplied as a second argument
  /// once the target disease is found, it updates it in the [_activeEnglishRecommendation]
  /// this can later be translated, modified or used with [copyWith] parameter on the object
  getRecommendation({
    required String disease,
    String? crop,
  }) {
    switch (_languages.indexOf(_activeLanguage.value)) {
      case 0:
        return getEnglishRecommendation(disease: disease, crop: crop);
      case 1:
        return getAsanteRecommendation(disease: disease, crop: crop);
      case 2:
        return getAkuapemRecommendation(disease: disease, crop: crop);
      case 3:
        return getEweRecommendation(disease: disease, crop: crop);
      case 4:
        return getHausaRecommendation(disease: disease, crop: crop);
      default:
        return getEnglishRecommendation(disease: disease, crop: crop);
    }
  }

  /// Get the [RecommendationModel] for English
  getEnglishRecommendation({
    required String disease,
    String? crop,
  }) {
    late DiseaseModel targetDisease;

    /// Search for the disease in the specified crop's recommendations
    if (crop != null) {
      switch (crop) {
        case 'maize':
          targetDisease = _cornRecommendations.firstWhere(
            (diseaseModel) => diseaseModel.disease == disease,
            orElse: () => _unknownDisease.value,
          );
          break;
        case 'tomato':
          targetDisease = _tomatoRecommendations.firstWhere(
            (diseaseModel) => diseaseModel.disease == disease,
            orElse: () => _unknownDisease.value,
          );
          break;
        case 'pepper':
          targetDisease = _pepperRecommendations.firstWhere(
            (diseaseModel) => diseaseModel.disease == disease,
            orElse: () => _unknownDisease.value,
          );
          break;
        default:
          targetDisease = _unknownDisease.value;
          break;
      }
    } else {
      targetDisease = _allRecommendations.firstWhere(
        (diseaseModel) => diseaseModel.disease == disease,
        orElse: () => _unknownDisease.value,
      );
    }
    // debugPrint("target disease $targetDisease");
    _activeEnglishRecommendation.value = targetDisease;
    _setActiveRecommendation(targetDisease);
    update();
    return targetDisease;
  }

  /// Get the [RecommendationModel] for Asante Twi
  getAsanteRecommendation({
    required String disease,
    String? crop,
  }) {
    late DiseaseModel targetDisease;

    /// Search for the disease in the specified crop's recommendations
    if (crop != null) {
      switch (crop) {
        case 'maize':
          targetDisease = _cornAsanteRecommendations.firstWhere(
            (diseaseModel) => diseaseModel.disease == disease,
            orElse: () => _unknownDisease.value,
          );
          break;
        case 'tomato':
          targetDisease = _tomatoAsanteRecommendations.firstWhere(
            (diseaseModel) => diseaseModel.disease == disease,
            orElse: () => _unknownDisease.value,
          );
          break;
        case 'pepper':
          targetDisease = _pepperAsanteRecommendations.firstWhere(
            (diseaseModel) => diseaseModel.disease == disease,
            orElse: () => _unknownDisease.value,
          );
          break;
        default:
          targetDisease = _unknownDisease.value;
          break;
      }
    } else {
      targetDisease = _allAsanteRecommendations.firstWhere(
        (diseaseModel) => diseaseModel.disease == disease,
        orElse: () => _unknownDisease.value,
      );
    }
    // debugPrint("target disease $targetDisease");
    _activeAsanteRecommendation.value = targetDisease;
    _setActiveRecommendation(targetDisease);
    update();
    return targetDisease;
  }

  /// Get the [RecommendationModel] for Akuapem Twi
  getAkuapemRecommendation({
    required String disease,
    String? crop,
  }) {
    late DiseaseModel targetDisease;

    /// Search for the disease in the specified crop's recommendations
    if (crop != null) {
      switch (crop) {
        case 'maize':
          targetDisease = _cornAkuapemRecommendations.firstWhere(
            (diseaseModel) => diseaseModel.disease == disease,
            orElse: () => _unknownDisease.value,
          );
          break;
        case 'tomato':
          targetDisease = _tomatoAkuapemRecommendations.firstWhere(
            (diseaseModel) => diseaseModel.disease == disease,
            orElse: () => _unknownDisease.value,
          );
          break;
        case 'pepper':
          targetDisease = _pepperAkuapemRecommendations.firstWhere(
            (diseaseModel) => diseaseModel.disease == disease,
            orElse: () => _unknownDisease.value,
          );
          break;
        default:
          targetDisease = _unknownDisease.value;
          break;
      }
    } else {
      targetDisease = _allAkuapemRecommendations.firstWhere(
        (diseaseModel) => diseaseModel.disease == disease,
        orElse: () => _unknownDisease.value,
      );
    }
    // debugPrint("target disease $targetDisease");
    _activeAkuapemRecommendation.value = targetDisease;
    _setActiveRecommendation(targetDisease);
    update();
    return targetDisease;
  }

  /// Get the [RecommendationModel] for Ewe
  getEweRecommendation({
    required String disease,
    String? crop,
  }) {
    late DiseaseModel targetDisease;

    /// Search for the disease in the specified crop's recommendations
    if (crop != null) {
      switch (crop) {
        case 'maize':
          targetDisease = _cornEweRecommendations.firstWhere(
            (diseaseModel) => diseaseModel.disease == disease,
            orElse: () => _unknownDisease.value,
          );
          break;
        case 'tomato':
          targetDisease = _tomatoEweRecommendations.firstWhere(
            (diseaseModel) => diseaseModel.disease == disease,
            orElse: () => _unknownDisease.value,
          );
          break;
        case 'pepper':
          targetDisease = _pepperEweRecommendations.firstWhere(
            (diseaseModel) => diseaseModel.disease == disease,
            orElse: () => _unknownDisease.value,
          );
          break;
        default:
          targetDisease = _unknownDisease.value;
          break;
      }
    } else {
      targetDisease = _allEweRecommendations.firstWhere(
        (diseaseModel) => diseaseModel.disease == disease,
        orElse: () => _unknownDisease.value,
      );
    }
    // debugPrint("target disease $targetDisease");
    _activeEweRecommendation.value = targetDisease;
    _setActiveRecommendation(targetDisease);
    update();
    return targetDisease;
  }

  /// Get the [RecommendationModel] for Hausa
  getHausaRecommendation({
    required String disease,
    String? crop,
  }) {
    late DiseaseModel targetDisease;

    /// Search for the disease in the specified crop's recommendations
    if (crop != null) {
      switch (crop) {
        case 'maize':
          targetDisease = _cornHausaRecommendations.firstWhere(
            (diseaseModel) => diseaseModel.disease == disease,
            orElse: () => _unknownDisease.value,
          );
          break;
        case 'tomato':
          targetDisease = _tomatoHausaRecommendations.firstWhere(
            (diseaseModel) => diseaseModel.disease == disease,
            orElse: () => _unknownDisease.value,
          );
          break;
        case 'pepper':
          targetDisease = _pepperHausaRecommendations.firstWhere(
            (diseaseModel) => diseaseModel.disease == disease,
            orElse: () => _unknownDisease.value,
          );
          break;
        default:
          targetDisease = _unknownDisease.value;
          break;
      }
    } else {
      targetDisease = _allHausaRecommendations.firstWhere(
        (diseaseModel) => diseaseModel.disease == disease,
        orElse: () => _unknownDisease.value,
      );
    }
    // debugPrint("target disease $targetDisease");
    _activeHausaRecommendation.value = targetDisease;
    _setActiveRecommendation(targetDisease);
    update();
    return targetDisease;
  }

  /// Reset the active recommendation to the default
  setRecToEnglish() {
    _activeRecommendation.value = _activeEnglishRecommendation.value;
    update();
  }

  reset() {
    _activeLanguage.value = _languages[0];
    _activeEweRecommendation.value = null;
    _activeAsanteRecommendation.value = null;
    _activeAkuapemRecommendation.value = null;
    _activeHausaRecommendation.value = null;
    _activeEnglishRecommendation.value = null;
    _activeRecommendation.value = null;
    _allRecommendations.clear();
    _tomatoRecommendations.clear();
    _cornRecommendations.clear();
    _pepperRecommendations.clear();
    _allAsanteRecommendations.clear();
    _tomatoAsanteRecommendations.clear();
    _cornAsanteRecommendations.clear();
    _pepperAsanteRecommendations.clear();
    _allAkuapemRecommendations.clear();
    _tomatoAkuapemRecommendations.clear();
    _cornAkuapemRecommendations.clear();
    _pepperAkuapemRecommendations.clear();
    _allEweRecommendations.clear();
    _tomatoEweRecommendations.clear();
    _cornEweRecommendations.clear();
    _pepperEweRecommendations.clear();
    _allHausaRecommendations.clear();
    _tomatoHausaRecommendations.clear();
    _cornHausaRecommendations.clear();
    _pepperHausaRecommendations.clear();
    update();
  }

  /// Getters
  DiseaseModel? get activeRecommendation => _activeRecommendation.value;

  /// all languages
  List<String> get languages => _languages;
  String get activeLanguage => _activeLanguage.value;
}
