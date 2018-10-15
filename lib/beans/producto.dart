class Producto {
  int id;
  String nombre;
  String descripcion;
  bool disponible;
  int numExistencias;
  double precio;
  //Poner un campo tipo, que sea una enum (periferico,consumible,etc)

  Producto(int id,String nombre, String descripcion, bool disponible, int numExistencias, double precio) {
    this.id = id;
    this.nombre = nombre;
    this.descripcion = descripcion;
    this.disponible = disponible;
    this.numExistencias = numExistencias;
    this.precio = precio;
  }
}