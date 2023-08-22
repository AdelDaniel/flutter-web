import 'dart:convert';

abstract class Serialization<T extends Serialization<T>> {
  /// json.decode String to map to object
  T fromJson(String source);

  /// convert [map] <String, dynamic> to AppLocale object
  T fromMap(Map<String, dynamic> map);

  ///
  Map<String, dynamic> toMap();

  ///json.encode object to map to string
  String toJson() => json.encode(toMap());
}
