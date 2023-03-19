import 'package:flutter/material.dart';

import '../../constants/enums/network_result_enums.dart';

typedef DoubleFunction = Function(double)?;

typedef StringFunction = void Function(String?)?;

typedef NetworkCallBack = void Function(NetworkResultEnums result);

typedef JsonMap = Map<String, dynamic>;

typedef OffsetEffectBuilder = Widget Function(
  BuildContext context,
  Offset offset,
  Widget? child,
);

typedef GyroscopeEffectBuilder = Widget Function(
    BuildContext context, Offset offset, Widget? child);
