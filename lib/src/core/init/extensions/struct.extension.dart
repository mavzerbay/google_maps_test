extension BoolExtension on bool? {
  bool get isTrue => this != null && this == true;
  bool get isFalse => this != null && this == false;
}
