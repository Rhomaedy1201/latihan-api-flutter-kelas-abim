import 'dart:convert';

TesModel tesModelFromJson(String str) => TesModel.fromJson(json.decode(str));

String tesModelToJson(TesModel data) => json.encode(data.toJson());

class TesModel {
    String message;
    List<Datum> data;

    TesModel({
        required this.message,
        required this.data,
    });

    factory TesModel.fromJson(Map<String, dynamic> json) => TesModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String templateSertifikasi;
    int idLembaga;
    String sertifikasi;
    int masaBerlaku;
    DateTime createdAt;
    dynamic updatedAt;
    String namaLembaga;

    Datum({
        required this.id,
        required this.templateSertifikasi,
        required this.idLembaga,
        required this.sertifikasi,
        required this.masaBerlaku,
        required this.createdAt,
        required this.updatedAt,
        required this.namaLembaga,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        templateSertifikasi: json["template_sertifikasi"],
        idLembaga: json["id_lembaga"],
        sertifikasi: json["sertifikasi"],
        masaBerlaku: json["masa_berlaku"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        namaLembaga: json["nama_lembaga"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "template_sertifikasi": templateSertifikasi,
        "id_lembaga": idLembaga,
        "sertifikasi": sertifikasi,
        "masa_berlaku": masaBerlaku,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "nama_lembaga": namaLembaga,
    };
}
