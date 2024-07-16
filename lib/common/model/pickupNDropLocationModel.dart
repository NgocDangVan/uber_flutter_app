import 'dart:convert';

class PickupNDropLocationModel {
  String? name;
  String? description;
  String? placeID;
  String? latitude;
  String? longitude;
  PickupNDropLocationModel(
    this.name,
    this.description,
    this.placeID,
    this.latitude,
    this.longitude,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'placeID': placeID,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory PickupNDropLocationModel.fromMap(Map<String, dynamic> map) {
    return PickupNDropLocationModel(
      map['name'] != null ? map['name'] as String : null,
      map['description'] != null ? map['description'] as String : null,
      map['placeID'] != null ? map['placeID'] as String : null,
      map['latitude'] != null ? map['latitude'] as String : null,
      map['longitude'] != null ? map['longitude'] as String : null,
    );
  }

  factory PickupNDropLocationModel.fromJson(String source) =>
      PickupNDropLocationModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
