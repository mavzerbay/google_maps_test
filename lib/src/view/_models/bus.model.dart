// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'bus.model.g.dart';

@JsonSerializable()
class BusModel extends INetworkModel<BusModel> {
  @JsonKey(name: 'Adi')
  final String? adi;
  @JsonKey(name: 'HatNo')
  final int? hatNo;

  BusModel({
    this.adi,
    this.hatNo,
  });

  @override
  BusModel fromJson(Map<String, dynamic> json) {
    return _$BusModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$BusModelToJson(this);
  }

  factory BusModel.fromJson(Map<String, dynamic> json) =>
      _$BusModelFromJson(json);
}
