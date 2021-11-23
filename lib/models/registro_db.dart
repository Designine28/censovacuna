class RegistroDb {
  final String nombre;
  final String email;
  final String total;
  final String personVacu;
  final String direccion;
  final String codigo;
  final String fecha;

  RegistroDb(
      {required this.nombre,
      required this.email,
      required this.total,
      required this.personVacu,
      required this.direccion,
      required this.codigo,
      required this.fecha});

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'email': email,
      'total': total,
      'personVacu': personVacu,
      'direccion': direccion,
      'codigo': codigo,
      'fecha': fecha
    };
  }
}
