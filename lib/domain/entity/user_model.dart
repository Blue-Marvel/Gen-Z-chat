class User {
  final id;
  final String username;
  final String email;
  final String image;
  final bool isVerified;
  String? phoneNo;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.image,
    required this.isVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['name'],
      email: json['email'],
      image: json['profile_image_url'],
      isVerified: json['is_verified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': username,
      'email': email,
      'profile_image_url': image,
      'is_verified': isVerified,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, username: $username, email: $email, image: $image, isVerified: $isVerified}';
  }
}
