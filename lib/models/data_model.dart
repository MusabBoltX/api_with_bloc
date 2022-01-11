// To parse this JSON data, do
//
//     final doctorsModel = doctorsModelFromJson(jsonString);

import 'dart:convert';

DoctorsModel doctorsModelFromJson(String str) => DoctorsModel.fromJson(json.decode(str));

String doctorsModelToJson(DoctorsModel data) => json.encode(data.toJson());

class DoctorsModel {
  DoctorsModel({
    this.status,
    this.message,
    this.result,
  });

  bool? status;
  String? message;
  List<Result>? result;

  factory DoctorsModel.fromJson(Map<String, dynamic> json) => DoctorsModel(
    status: json["status"],
    message: json["message"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.latitude,
    this.longtitude,
    this.address,
    this.ratingScore,
    this.image,
    this.availabilityStatus,
    this.doctorCountry,
    this.phoneNumber,
    this.experience,
    this.price,
    this.degree,
    this.recommended,
    this.isFree,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? firstName;
  LastName? lastName;
  String? email;
  String? latitude;
  String? longtitude;
  String? address;
  double? ratingScore;
  String? image;
  AvailabilityStatus? availabilityStatus;
  DoctorCountry? doctorCountry;
  String? phoneNumber;
  String? experience;
  String? price;
  String? degree;
  int? recommended;
  int? isFree;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    firstName: json["first_name"],
    lastName: lastNameValues.map[json["last_name"]],
    email: json["email"],
    latitude: json["latitude"],
    longtitude: json["longtitude"],
    address: json["address"],
    ratingScore: json["rating_score"].toDouble(),
    image: json["image"],
    availabilityStatus: availabilityStatusValues.map[json["availability_status"]],
    doctorCountry: doctorCountryValues.map[json["doctor_country"]],
    phoneNumber: json["phone_number"],
    experience: json["experience"],
    price: json["price"],
    degree: json["degree"],
    recommended: json["recommended"],
    isFree: json["is_free"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastNameValues.reverse![lastName],
    "email": email,
    "latitude": latitude,
    "longtitude": longtitude,
    "address": address,
    "rating_score": ratingScore,
    "image": image,
    "availability_status": availabilityStatusValues.reverse![availabilityStatus],
    "doctor_country": doctorCountryValues.reverse![doctorCountry],
    "phone_number": phoneNumber,
    "experience": experience,
    "price": price,
    "degree": degree,
    "recommended": recommended,
    "is_free": isFree,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}

enum AvailabilityStatus { OFFLINE, ONLINE }

final availabilityStatusValues = EnumValues({
  "offline": AvailabilityStatus.OFFLINE,
  "online": AvailabilityStatus.ONLINE
});

enum AtedAt { THE_0000011130_T00_0000000000_Z }

final atedAtValues = EnumValues({
  "-000001-11-30T00:00:00.000000Z": AtedAt.THE_0000011130_T00_0000000000_Z
});

enum DoctorCountry { PAKISTAN }

final doctorCountryValues = EnumValues({
  "Pakistan": DoctorCountry.PAKISTAN
});

enum LastName { EMPTY, TEST, SHAJI, DOCTOR }

final lastNameValues = EnumValues({
  "doctor": LastName.DOCTOR,
  "": LastName.EMPTY,
  "Shaji": LastName.SHAJI,
  "test": LastName.TEST
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
