// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_stop.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusStopModel _$BusStopModelFromJson(Map<String, dynamic> json) => BusStopModel(
      gecenHatlar: (json['GecenHatlar'] as List<dynamic>?)
          ?.map((e) => BusModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['Id'] as int?,
      koorX: (json['KoorX'] as num?)?.toDouble(),
      adi: json['Adi'] as String?,
      mesafe: (json['Mesafe'] as num?)?.toDouble(),
      koorY: (json['KoorY'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BusStopModelToJson(BusStopModel instance) =>
    <String, dynamic>{
      'GecenHatlar': instance.gecenHatlar,
      'Id': instance.id,
      'KoorX': instance.koorX,
      'Adi': instance.adi,
      'Mesafe': instance.mesafe,
      'KoorY': instance.koorY,
    };
