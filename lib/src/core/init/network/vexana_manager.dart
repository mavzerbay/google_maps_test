import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instance;
  static VexanaManager get instance {
    if (_instance != null) return _instance!;
    _instance = VexanaManager._init();
    return _instance!;
  }

  static const String baseUrl = "https://openapi.izmir.bel.tr/api";

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager<EmptyModel>(
    isEnableLogger: true,
    isEnableTest: true,
    options: BaseOptions(
      baseUrl: baseUrl,
      followRedirects: true,
    ),
  );
}
