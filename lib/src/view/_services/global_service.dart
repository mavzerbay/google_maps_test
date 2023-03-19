import 'package:mobile_task/src/view/_models/bus_detail_response.model.dart';

import '../_models/bus_stop.model.dart';

import '../_models/pharmacy.model.dart';
import 'package:vexana/vexana.dart';

abstract class IGlobalService {
  final INetworkManager networkManager;
  IGlobalService(this.networkManager);

  Future<IResponseModel<List<PharmacyModel>?, INetworkModel<dynamic>?>>
      getPharmacies();

  Future<IResponseModel<List<BusStopModel>?, INetworkModel<dynamic>?>>
      getBusStops(double lat, double lng);

  Future<IResponseModel<BusDetailResponseModel?, INetworkModel<dynamic>?>>
      getBus(String lineNo);
}

class GlobalService extends IGlobalService {
  GlobalService(super.networkManager);

  @override
  Future<IResponseModel<List<PharmacyModel>?, INetworkModel<dynamic>?>>
      getPharmacies() async {
    final response =
        await networkManager.send<PharmacyModel, List<PharmacyModel>>(
      '/ibb/nobetcieczaneler',
      parseModel: PharmacyModel(),
      method: RequestType.GET,
    );
    return response;
  }

  @override
  Future<IResponseModel<List<BusStopModel>?, INetworkModel<dynamic>?>>
      getBusStops(double lat, double lng) async {
    final response =
        await networkManager.send<BusStopModel, List<BusStopModel>>(
      '/eshot/yakinduraklar/$lat/$lng',
      parseModel: BusStopModel(),
      method: RequestType.GET,
    );
    return response;
  }

  @override
  Future<IResponseModel<BusDetailResponseModel?, INetworkModel<dynamic>?>>
      getBus(String lineNo) async {
    final response = await networkManager
        .send<BusDetailResponseModel, BusDetailResponseModel>(
      '/eshot/hatara/$lineNo',
      parseModel: BusDetailResponseModel(),
      method: RequestType.GET,
    );
    return response;
  }
}
