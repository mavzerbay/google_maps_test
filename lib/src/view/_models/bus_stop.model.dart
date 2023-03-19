import 'package:json_annotation/json_annotation.dart';
import 'bus.model.dart';
import 'package:vexana/vexana.dart';

part 'bus_stop.model.g.dart';

@JsonSerializable()
class BusStopModel extends INetworkModel<BusStopModel> {
  @JsonKey(name: 'GecenHatlar')
  final List<BusModel>? gecenHatlar;
  @JsonKey(name: 'Id')
  final int? id;
  @JsonKey(name: 'KoorX')
  final double? koorX;
  @JsonKey(name: 'Adi')
  final String? adi;
  @JsonKey(name: 'Mesafe')
  final double? mesafe;
  @JsonKey(name: 'KoorY')
  final double? koorY;

  BusStopModel({
    this.gecenHatlar,
    this.id,
    this.koorX,
    this.adi,
    this.mesafe,
    this.koorY,
  });

  @override
  BusStopModel fromJson(Map<String, dynamic> json) {
    return _$BusStopModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$BusStopModelToJson(this);
  }
}
