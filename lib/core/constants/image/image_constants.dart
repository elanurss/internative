class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    _instance ??= _instance = ImageConstants._init();
    return _instance!;
  }

  ImageConstants._init();

  String toImage(String name) => "assets/images/$name";

  String get logo => toImage("internative_bg.png");
  String get svg => toImage("profil.svg");
  String get search => toImage("search.png");
  String get defaultImage => toImage("defaultImage.png");
  String get notfound => toImage("notfound.svg");
}
