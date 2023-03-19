extension AssetExtension on String {
  String get toPng => 'assets/images/$this.png';
  String get toJpg => 'assets/images/$this.jpg';
  String get toLottie => 'assets/lottie/$this.json';
  String get toJpeg => 'assets/images/$this.jpeg';
}
