import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_task/src/view/_models/bus_line.model.dart';
import 'package:vexana/vexana.dart';

part 'bus_detail_response.model.g.dart';

@JsonSerializable()
class BusDetailResponseModel extends INetworkModel<BusDetailResponseModel> {
  @JsonKey(name: 'HataMesaj')
  final String? hataMesaj;
  @JsonKey(name: 'HataVarMi')
  final bool? hataVarMi;
  @JsonKey(name: 'Hatlar')
  final List<BusLineModel>? hatlar;

  BusDetailResponseModel({
    this.hataMesaj,
    this.hataVarMi,
    this.hatlar,
  });

  @override
  BusDetailResponseModel fromJson(Map<String, dynamic> json) {
    return _$BusDetailResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$BusDetailResponseModelToJson(this);
  }
}
