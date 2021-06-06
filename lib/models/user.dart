class User {
  String? id;
  String? name;
  String? email;
  String? otp;
  String? updatedAt;
  String? createdAt;

  User({
    this.id,
    this.name,
    this.email,
    this.otp,
    this.updatedAt,
    this.createdAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    otp = json['otp'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }
}
