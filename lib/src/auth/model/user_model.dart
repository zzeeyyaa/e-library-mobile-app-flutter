class UserModel {
  final String id;
  final String email;
  final String displayName;
  final String photoURL;
  final String password;

  UserModel({
    required this.id,
    required this.email,
    required this.displayName,
    required this.photoURL,
    required this.password,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      email: data['email'],
      displayName: data['displayName'],
      photoURL: data['photoURL'],
      password: data['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
      'password': password,
    };
  }
}
