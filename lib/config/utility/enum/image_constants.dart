enum ImageConstants {
  bell("bell"),
  home("home"),
  profile("profile"),
  ticket("ticket"),
  ;

  final String value;
  const ImageConstants(this.value);

  String get getPng => 'assets/images/$value.png';
  String get getSvg => 'assets/svg/$value.svg';
}
