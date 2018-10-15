import 'package:demo_flutter/beans/producto.dart';
import 'package:demo_flutter/beans/producto_especial.dart';
import 'dart:math';

class Inventario {

  static List<Producto> listaProductos;

  Inventario() {
    if (listaProductos==null) {
      Inventario.listaProductos = new List<Producto>();
      Random r = new Random();
      Producto p = Producto(1,"Producto 1", "Descripcion 1", true, r.nextInt(100),r.nextDouble());
      listaProductos.add(p);
    }
  }

  void anadirProducto(Producto p) {
    listaProductos.add(p);
  }

  Producto obtenerProducto(int id) {
    Producto encontrado = null;
    listaProductos.forEach((product) {
      if (product.id == id) {
        encontrado = product;
      }
    });
    return encontrado;
  }

  void borrarProducto(Producto p) {
    listaProductos.remove(p);
  }

  void modificarProducto(Producto p) {
    listaProductos.forEach((product) {
      if (product.id == p.id) {
        product.id = p.id;
        product.nombre = p.nombre;
        product.descripcion = p.descripcion;
        product.disponible = p.disponible;
        product.numExistencias = p.numExistencias;
        product.precio = p.precio;
        if (p is ProductoEspecial) {
          (product as ProductoEspecial).iva = p.iva;
          (product as ProductoEspecial).descuento = p.descuento;
        }

      }
    });
  }

  List<Producto> getProductos() {
    return listaProductos;
  }

  void mostrarInventario() {
    listaProductos.forEach((product) {
      print("--------------------------");
      print("Id: " + product.id.toString());
      print("Nombre: " + product.nombre);
      print("Descripcion: " + product.descripcion);
      print("Precio: " + product.precio.toString());
      print("numExistencias: " + product.numExistencias.toString());
      print("--------------------------");
      print("");
    });
  }

}