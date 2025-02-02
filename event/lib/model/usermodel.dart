class UserModel {
  String id;
  String name;
  String email;

  int createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,

    required this.createdAt,
  });

  // Convert a UserModel instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,

      'createdAt': createdAt,
    };
  }

  // Create a UserModel instance from a JSON object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],

      createdAt: json['createdAt'],
    );
  }
}
