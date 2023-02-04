// To parse this JSON data, do
//
//     final carsModel = carsModelFromJson(jsonString);


import 'dart:convert';

CarsModel carsModelFromJson(String str) => CarsModel.fromJson(json.decode(str));

String carsModelToJson(CarsModel data) => json.encode(data.toJson());

class CarsModel {
    CarsModel({
        required this.arabaAdi,
        required this.ulke,
        required this.kurulus,
        required this.model,
    });

    final String arabaAdi;
    final String ulke;
    final int kurulus;
    final List<Model> model;

    factory CarsModel.fromJson(Map<String, dynamic> json) => CarsModel(
        arabaAdi: json["araba_adi"],
        ulke: json["ulke"],
        kurulus: json["kurulus"],
        model: List<Model>.from(json["model"].map((x) => Model.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "araba_adi": arabaAdi,
        "ulke": ulke,
        "kurulus": kurulus,
        "model": List<dynamic>.from(model.map((x) => x.toJson())),
    };
}

class Model {
    Model({
        required this.modelAdi,
        required this.fiyat,
        required this.benzinli,
    });

    final String modelAdi;
    final int fiyat;
    final bool benzinli;

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        modelAdi: json["model_adi"],
        fiyat: json["fiyat"],
        benzinli: json["benzinli"],
    );

    Map<String, dynamic> toJson() => {
        "model_adi": modelAdi,
        "fiyat": fiyat,
        "benzinli": benzinli,
    };
}
