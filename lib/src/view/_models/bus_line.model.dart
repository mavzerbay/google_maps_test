import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'bus_line.model.g.dart';

@JsonSerializable()
class BusLineModel extends INetworkModel<BusLineModel> {
  @JsonKey(name: 'HimHatId')
  final int? himHatId;
  @JsonKey(name: 'Aciklama')
  final String? aciklama;
  @JsonKey(name: 'HatBitis')
  final String? hatBitis;
  @JsonKey(name: 'HatBaslangic')
  final String? hatBaslangic;
  @JsonKey(name: 'Tarife')
  final String? tarife;
  @JsonKey(name: 'CalismaSaatiDonus')
  final String? calismaSaatiDonus;
  @JsonKey(name: 'CalismaSaatiGidis')
  final String? calismaSaatiGidis;
  @JsonKey(name: 'GuzergahAciklama')
  final String? guzergahAciklama;
  @JsonKey(name: 'HatId')
  final int? hatId;
  @JsonKey(name: 'HatNo')
  final int? hatNo;
  @JsonKey(name: 'Adi')
  final String? adi;

  BusLineModel({
    this.himHatId,
    this.aciklama,
    this.hatBitis,
    this.hatBaslangic,
    this.tarife,
    this.calismaSaatiDonus,
    this.calismaSaatiGidis,
    this.guzergahAciklama,
    this.hatId,
    this.hatNo,
    this.adi,
  });

  @override
  BusLineModel fromJson(Map<String, dynamic> json) {
    return _$BusLineModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$BusLineModelToJson(this);
  }

  factory BusLineModel.fromJson(Map<String, dynamic> json) =>
      _$BusLineModelFromJson(json);
}
