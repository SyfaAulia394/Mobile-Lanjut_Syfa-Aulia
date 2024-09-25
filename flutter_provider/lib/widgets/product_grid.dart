import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/all_product.dart'; // Perbaiki tanda kutip
import 'package:flutter_provider/widgets/product_item.dart'; // Perbaiki tanda kutip
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context); // Ambil data produk dari provider
    final allProducts = productData.allProducts; // Ambil semua produk

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: allProducts.length,
      itemBuilder: (ctx, i) => ProductItem(
        allProducts[i].id!, // Gunakan '!' jika yakin tidak null
        allProducts[i].title!, // Gunakan '!' jika yakin tidak null
        allProducts[i].imageUrl!, // Gunakan '!' jika yakin tidak null
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10, // Perbaiki typo
        mainAxisSpacing: 10,
      ),
    );
  }
}
