// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_line.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusLineModel _$BusLineModelFromJson(Map<String, dynamic> json) => BusLineModel(
      himHatId: json['HimHatId'] as int?,
      aciklama: json['Aciklama'] as String?,
      hatBitis: json['HatBitis'] as String?,
      hatBaslangic: json['HatBaslangic'] as String?,
      tarife: json['Tarife'] as String?,
      calismaSaatiDonus: json['CalismaSaatiDonus'] as String?,
      calismaSaatiGidis: json['CalismaSaatiGidis'] as String?,
      guzergahAciklama: json['GuzergahAciklama'] as String?,
      hatId: json['HatId'] as int?,
      hatNo: json['HatNo'] as int?,
      adi: json['Adi'] as String?,
    );

Map<String, dynamic> _$BusLineModelToJson(BusLineModel instance) =>
    <String, dynamic>{
      'HimHatId': instance.himHatId,
      'Aciklama': instance.aciklama,
      'HatBitis': instance.hatBitis,
      'HatBaslangic': instance.hatBaslangic,
      'Tarife': instance.tarife,
      'CalismaSaatiDonus': instance.calismaSaatiDonus,
      'CalismaSaatiGidis': instance.calismaSaatiGidis,
      'GuzergahAciklama': instance.guzergahAciklama,
      'HatId': instance.hatId,
      'HatNo': instance.hatNo,
      'Adi': instance.adi,
    };
