class User {
  String email;
  String nombre;
  String password;
  int rol;

  User(String email,String nombre,String password,int rol){
    this.email = email;
    this.nombre = nombre;
    this.password=password;
    this.rol= rol;
  }

  User.onlyEmailName(String email,String nombre){
    this.email = email;
    this.nombre = nombre;
    this.password=null;
    this.rol= null;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['email'],json['nombre'],json['password'],json['rol']);
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'nombre': nombre,
    'password': password,
    'rol': rol
  };

}