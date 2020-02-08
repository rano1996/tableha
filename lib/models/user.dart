class User {
  String email;
  String password;

  User({this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(email: json['email'], password: json['password']);
  }
}

Map<String, dynamic> userData = {
  "email": "lama@gmail.com",
  "password": "123456"
};

User user = User.fromJson(userData);
