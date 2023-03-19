import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'pharmacy.model.g.dart';

@JsonSerializable()
class PharmacyModel extends INetworkModel<PharmacyModel> {
  @JsonKey(name: 'Tarih')
  final String? tarih;
  @JsonKey(name: 'LokasyonY')
  final String? lokasyonY;
  @JsonKey(name: 'LokasyonX')
  final String? lokasyonX;
  @JsonKey(name: 'BolgeAciklama')
  final String? bolgeAciklama;
  @JsonKey(name: 'Adi')
  final String? adi;
  @JsonKey(name: 'Telefon')
  final String? telefon;
  @JsonKey(name: 'Adres')
  final String? adres;
  @JsonKey(name: 'BolgeId')
  final int? bolgeId;
  @JsonKey(name: 'Bolge')
  final String? bolge;
  @JsonKey(name: 'UzaklikMetre')
  final int? uzaklikMetre;
  @JsonKey(name: 'EczaneId')
  final int? eczaneId;
  @JsonKey(name: 'IlceId')
  final int? ilceId;

  PharmacyModel({
    this.tarih,
    this.lokasyonY,
    this.lokasyonX,
    this.bolgeAciklama,
    this.adi,
    this.telefon,
    this.adres,
    this.bolgeId,
    this.bolge,
    this.uzaklikMetre,
    this.eczaneId,
    this.ilceId,
  });

  @override
  PharmacyModel fromJson(Map<String, dynamic> json) {
    return _$PharmacyModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$PharmacyModelToJson(this);
  }

  factory PharmacyModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyModelFromJson(json);
}
