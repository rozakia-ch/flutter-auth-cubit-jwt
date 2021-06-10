class User {
  String? id;
  String? name;
  String? email;
  String? otp;
  String? updatedAt;
  String? createdAt;
  bool? emailVerified;
  String? imageProfile;
  User({
    this.id,
    this.name,
    this.email,
    this.otp,
    this.updatedAt,
    this.createdAt,
    this.emailVerified,
    this.imageProfile,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    otp = json['otp'].toString();
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    emailVerified = json['email_verified'];
    imageProfile = json['image_profile'];
  }
}
