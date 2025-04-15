// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/product_provider.dart';
// import 'edit_screen.dart';

// class ProductDetailScreen extends StatelessWidget {
//   final String id;
//   const ProductDetailScreen({super.key, required this.id});

//   @override
//   Widget build(BuildContext context) {
//     final product = Provider.of<ProductProvider>(context).getById(id);
//     final themeColor = const Color.fromARGB(255, 33, 1, 87);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Product Detail',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: themeColor,
//         elevation: 4,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(Icons.shopping_bag, size: 60, color: themeColor),
//             const SizedBox(height: 16),
//             Text(
//               product.name,
//               style: const TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               product.description,
//               style: const TextStyle(fontSize: 16, color: Colors.black54),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               '\$${product.price.toStringAsFixed(2)}',
//               style: const TextStyle(fontSize: 22, color: Colors.green),
//             ),
//             const Spacer(),
//             Center(
//               child: ElevatedButton.icon(
//                 icon: const Icon(Icons.edit, color: Colors.white),
//                 label: const Text(
//                   "Edit Product",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: themeColor,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 24,
//                     vertical: 12,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => EditScreen(product: product),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import 'edit_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final String id;
  const ProductDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context).getById(id);
    final themeColor = const Color.fromARGB(255, 33, 1, 87);

    // 💡 Safely handle deleted product
    if (product == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Product Not Found',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: themeColor,
        ),
        body: const Center(
          child: Text(
            'This product has been deleted.',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Detail',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: themeColor,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.shopping_bag, size: 60, color: themeColor),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 22, color: Colors.green),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text(
                  "Edit Product",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditScreen(product: product),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
