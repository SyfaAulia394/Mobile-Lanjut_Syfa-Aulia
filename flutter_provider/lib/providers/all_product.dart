import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_provider/models/product.dart';
 // Pastikan path impor ini benar

class Products with ChangeNotifier {
  // Properti allProduct (underscore digunakan untuk menandakan bahwa ini private)
  List<product> _allproducts = List.generate(
    25,
    (index) {
      return product(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/200/300/',
      );
    },
  );

  // Getter allProducts (mengembalikan salinan list untuk menjaga imutabilitas)
  List<product> get allProducts {
    return [..._allproducts];
  }
}
