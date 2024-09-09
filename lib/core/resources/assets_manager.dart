const String imagesPatch = 'assets/images/';
const String iconsPatch = 'assets/icons/';
const String svgPatch = 'assets/svg/';
const String jsonPatch = 'assets/json/';

abstract class ImageAssets {
  static const String logo = '${imagesPatch}logo.png';
  static const String splash = '${imagesPatch}splash.png';
}

abstract class IconAssets {
  static const String logo = '${iconsPatch}logo.png';
  static const String icHome = '${iconsPatch}home.png';
  static const String icUser = '${iconsPatch}user.png';
  static const String icHeart = '${iconsPatch}heart.png';
  static const String icCategories = '${iconsPatch}category.png';
}

abstract class SvgAssets {
  static const String logo = '${svgPatch}logo.svg';
}
