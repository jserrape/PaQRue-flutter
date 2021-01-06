class Park {
  int id;
  String nombre;
  String descripcion;
  String latitud;
  String longitud;
  String imagenLista;
  String imagenGrande;
  String horario;
  String direccion;
  double distancia;

  Park(Map<String, dynamic> json){
    this.id = json['id'];
    this.nombre = json['nombre'];
    this.descripcion = json['descripcion'];
    this.latitud = json['latitud'];
    this.longitud = json['longitud'];
    this.imagenLista = json['imagenLista'];
    this.imagenGrande = json['imagenGrande'];
    this.horario = json['horario'];
    this.direccion = json['direccion'];
    this.distancia = 0;
  }



  @override
  String toString() {
    return 'Park{id: $id, nombre: $nombre, descripcion: $descripcion, latitud: $latitud, longitud: $longitud, imagenLista: $imagenLista, imagenGrande: $imagenGrande, horario: $horario, direccion: $direccion}';
  }
}