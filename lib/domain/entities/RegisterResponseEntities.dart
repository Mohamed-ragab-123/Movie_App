class RegisterResponseEntity {
  RegisterResponseEntity({
    this.message,
    this.data,
    this.statusCode,
  });

  String? message;
  DataEntity? data;
  String? statusCode;
}

class DataEntity {
  DataEntity({
    this.email,
    this.password,
    this.name,
    this.phone,
    this.avaterId,

  });

  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;

}
