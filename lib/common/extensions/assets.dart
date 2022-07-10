extension ImagesExtension on String {
  String get assetPath => 'assets/images/$this';
  String get assetPathPNG => 'assets/images/$this.png';
  String get assetPathIconSVG => 'assets/icons/$this.svg';
  String get assetPathIconPNG => 'assets/icons/$this.png';
  String get assetPathIconGIF => 'assets/icons/$this.gif';
}
