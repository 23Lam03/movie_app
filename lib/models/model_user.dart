import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelUser {
  String image;
  String email;

  String name;
  String fullName;
  String phone;
  String sex;
  ModelUser({
    required this.image,
    required this.email,
    required this.name,
    required this.fullName,
    required this.phone,
    required this.sex,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'email': email,
      'name': name,
      'fullName': fullName,
      'phone': phone,
      'sex': sex,
    };
  }

  factory ModelUser.fromMap(Map<String, dynamic> map) {
    return ModelUser(
      image: map['image'] ??
          'https://media.istockphoto.com/id/1337144146/vector/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=BIbFwuv7FxTWvh5S3vB6bkT0Qv8Vn8N5Ffseq84ClGI=',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      fullName: map['fullName'] ?? '',
      phone: map['phone'] ?? '',
      sex: map['sex'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelUser.fromJson(String source) =>
      ModelUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
