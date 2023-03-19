// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_detail_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusDetailResponseModel _$BusDetailResponseModelFromJson(
        Map<String, dynamic> json) =>
    BusDetailResponseModel(
      hataMesaj: json['HataMesaj'] as String?,
      hataVarMi: json['HataVarMi'] as bool?,
      hatlar: (json['Hatlar'] as List<dynamic>?)
          ?.map((e) => BusLineModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BusDetailResponseModelToJson(
        BusDetailResponseModel instance) =>
    <String, dynamic>{
      'HataMesaj': instance.hataMesaj,
      'HataVarMi': instance.hataVarMi,
      'Hatlar': instance.hatlar,
    };
