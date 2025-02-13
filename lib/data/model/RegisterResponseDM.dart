import 'package:movie_app/domain/entities/RegisterResponseEntities.dart';

class RegisterResponseDm extends RegisterResponseEntity {
  RegisterResponseDm({
    super.message,
    super.data,
    super.statusCode,
  });

  RegisterResponseDm.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataDM.fromJson(json['data']) : null;
  }
}

class DataDM extends DataEntity {
  DataDM({
    super.email,
    super.password,
    super.name,
    super.phone,
    super.avaterId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  DataDM.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
