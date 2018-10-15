import 'package:demo_flutter/beans/producto.dart';

class ProductoEspecial extends Producto {
  double iva;
  double descuento;

  ProductoEspecial(int id,String nombre, String descripcion, bool disponible, int numExistencias, double precio, double iva, double descuento) : super(id,nombre,descripcion,disponible,numExistencias, precio) {
    this.iva = iva;
    this.descuento = descuento;
  }
}