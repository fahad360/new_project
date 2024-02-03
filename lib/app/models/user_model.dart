import 'dart:convert';

class UserModel {
    String? uid;
    String? firstName;
    String? lastName;
    String? email;
    String? imageUrl;
    String? imageName;

    UserModel({
        this.uid,
        this.firstName,
        this.lastName,
        this.email,
        this.imageUrl,
        this.imageName,
    });

    factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        imageUrl: json["imageUrl"],
        imageName: json["imageName"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "imageUrl": imageUrl,
        "imageName": imageName,
    };
}
