// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/product.dart';
// import '../providers/product_provider.dart';

// class EditScreen extends StatefulWidget {
//   final Product product;
//   const EditScreen({super.key, required this.product});

//   @override
//   State<EditScreen> createState() => _EditScreenState();
// }

// class _EditScreenState extends State<EditScreen> {
//   late TextEditingController nameController;
//   late TextEditingController descController;
//   late TextEditingController priceController;

//   @override
//   void initState() {
//     nameController = TextEditingController(text: widget.product.name);
//     descController = TextEditingController(text: widget.product.description);
//     priceController = TextEditingController(
//       text: widget.product.price.toString(),
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<ProductProvider>(context, listen: false);

//     final themeColor = const Color.fromARGB(255, 33, 1, 87);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Edit Product',
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
//             const Icon(
//               Icons.edit_note,
//               size: 60,
//               color: Color.fromARGB(255, 33, 1, 87),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(
//                 labelText: 'Product Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: descController,
//               decoration: const InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: priceController,
//               decoration: const InputDecoration(
//                 labelText: 'Price',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton.icon(
//                   icon: const Icon(Icons.save, color: Colors.white),
//                   label: const Text(
//                     'Update',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: themeColor,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 12,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () async {
//                     await provider.updateProduct(
//                       Product(
//                         id: widget.product.id,
//                         name: nameController.text,
//                         description: descController.text,
//                         price: double.parse(priceController.text),
//                       ),
//                     );
//                     Navigator.pop(context);
//                   },
//                 ),
//                 ElevatedButton.icon(
//                   icon: const Icon(Icons.delete, color: Colors.white),
//                   label: const Text(
//                     'Delete',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 12,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () async {
//                     await provider.deleteProduct(widget.product.id);
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';

class EditScreen extends StatefulWidget {
  final Product product;
  const EditScreen({super.key, required this.product});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController nameController;
  late TextEditingController descController;
  late TextEditingController priceController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.product.name);
    descController = TextEditingController(text: widget.product.description);
    priceController = TextEditingController(
      text: widget.product.price.toString(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    final themeColor = const Color.fromARGB(255, 33, 1, 87);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Product',
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
            const Icon(
              Icons.edit_note,
              size: 60,
              color: Color.fromARGB(255, 33, 1, 87),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.save, color: Colors.white),
                  label: const Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    await provider.updateProduct(
                      Product(
                        id: widget.product.id,
                        name: nameController.text,
                        description: descController.text,
                        price: double.parse(priceController.text),
                      ),
                    );
                    if (mounted) Navigator.pop(context);
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.delete, color: Colors.white),
                  label: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    await provider.deleteProduct(widget.product.id);
                    if (mounted) Navigator.pop(context); // Pops EditScreen
                    // Optionally pop to home if EditScreen was pushed from DetailScreen
                    // Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
