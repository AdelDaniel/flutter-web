/// [ScreenSizeType]
/// to know the type of the screen:
/// [phone] width < smallScreenSize
/// [tablet] smallScreenSize <= width < mediumScreenSize
/// [web] mediumScreenSize <= width < largeScreenSize
/// [large] width < largeScreenSize
enum ScreenSizeType {
  /// [phone] width < smallScreenSize
  phone,

  /// [tablet] smallScreenSize <= width < mediumScreenSize
  tablet,

  /// [web] mediumScreenSize <= width < largeScreenSize
  web,

  /// [large] width < largeScreenSize
  large,
}
