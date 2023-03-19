// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyModel _$PharmacyModelFromJson(Map<String, dynamic> json) =>
    PharmacyModel(
      tarih: json['Tarih'] as String?,
      lokasyonY: json['LokasyonY'] as String?,
      lokasyonX: json['LokasyonX'] as String?,
      bolgeAciklama: json['BolgeAciklama'] as String?,
      adi: json['Adi'] as String?,
      telefon: json['Telefon'] as String?,
      adres: json['Adres'] as String?,
      bolgeId: json['BolgeId'] as int?,
      bolge: json['Bolge'] as String?,
      uzaklikMetre: json['UzaklikMetre'] as int?,
      eczaneId: json['EczaneId'] as int?,
      ilceId: json['IlceId'] as int?,
    );

Map<String, dynamic> _$PharmacyModelToJson(PharmacyModel instance) =>
    <String, dynamic>{
      'Tarih': instance.tarih,
      'LokasyonY': instance.lokasyonY,
      'LokasyonX': instance.lokasyonX,
      'BolgeAciklama': instance.bolgeAciklama,
      'Adi': instance.adi,
      'Telefon': instance.telefon,
      'Adres': instance.adres,
      'BolgeId': instance.bolgeId,
      'Bolge': instance.bolge,
      'UzaklikMetre': instance.uzaklikMetre,
      'EczaneId': instance.eczaneId,
      'IlceId': instance.ilceId,
    };
