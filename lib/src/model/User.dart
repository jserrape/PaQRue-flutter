class User {
  String email;
  String password;
  int rol;

  User(String email,String password,int rol){
    this.email = email;
    this.password=password;
    this.rol= rol;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['email'],json['password'],json['rol']);
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'rol': rol
  };

}