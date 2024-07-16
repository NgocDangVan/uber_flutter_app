import 'dart:convert';

class Profiledatemodel {
  String? name;
  String? profilePicUrl;
  String? mobileNumber;
  String? email;
  String? vehicleBrandName;
  String? vehicleModel;
  String? vehicleType;
  String? vehicleRegistrationNumber;
  String? drivingLicenseNumber;
  String? userType;
  DateTime? registeredDateTime;
  String? activeRideRequestID;
  String? driverStatus;
  String? cloudMessagingToken;

  Profiledatemodel(
      this.name,
      this.profilePicUrl,
      this.mobileNumber,
      this.email,
      this.vehicleBrandName,
      this.vehicleModel,
      this.vehicleType,
      this.vehicleRegistrationNumber,
      this.drivingLicenseNumber,
      this.userType,
      this.registeredDateTime,
      this.activeRideRequestID,
      this.driverStatus,
      this.cloudMessagingToken);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePicUrl': profilePicUrl,
      'mobileNumber': mobileNumber,
      'email': email,
      'vehicleBrandName': vehicleBrandName,
      'vehicleModel': vehicleModel,
      'vehicleType': vehicleType,
      'vehicleRegistrationNumber': vehicleRegistrationNumber,
      'drivingLicenseNumber': drivingLicenseNumber,
      'userType': userType,
      'registeredDateTime': registeredDateTime?.microsecondsSinceEpoch,
      'activeRideRequestID': activeRideRequestID,
      'driverStatus': driverStatus,
      'cloudMessagingToken': cloudMessagingToken,
    };
  }

  factory Profiledatemodel.fromMap(Map<String, dynamic> map) {
    return Profiledatemodel(
      map['name'] != null ? map['name'] as String : null,
      map['profilePicUrl'] != null ? map['profilePicUrl'] as String : null,
      map['mobileNumber'] != null ? map['mobileNumber'] as String : null,
      map['email'] != null ? map['email'] as String : null,
      map['vehicleBrandName'] != null
          ? map['vehicleBrandName'] as String
          : null,
      map['vehicleModel'] != null ? map['vehicleModel'] as String : null,
      map['vehicleType'] != null ? map['vehicleType'] as String : null,
      map['vehicleRegistrationNumber'] != null
          ? map['vehicleRegistrationNumber'] as String
          : null,
      map['drivingLicenseNumber'] != null
          ? map['drivingLicenseNumber'] as String
          : null,
      map['userType'] != null ? map['userType'] as String : null,
      map['registeredDateTime'] != null
          ? DateTime.fromMicrosecondsSinceEpoch(map['registeredDateTime'])
          : null,
      map['activeRideRequestID'] != null
          ? map['activeRideRequestID'] as String
          : null,
      map['driverStatus'] != null ? map['driverStatus'] as String : null,
      map['cloudMessagingToken'] != null
          ? map['cloudMessagingToken'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profiledatemodel.fromJson(String source) =>
      Profiledatemodel.fromMap(json.decode(source));
}
