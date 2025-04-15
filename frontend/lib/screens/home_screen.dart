import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import 'add_screen.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 33, 1, 87),
        elevation: 4,
      ),
      body: FutureBuilder(
        future: provider.fetchProducts(),
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const Center(child: CircularProgressIndicator());
          // }

          if (provider.products.isEmpty) {
            return const Center(
              child: Text(
                "No products added yet!",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: provider.products.length,
            itemBuilder: (ctx, i) {
              final p = provider.products[i];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  leading: const Icon(
                    Icons.shopping_bag,
                    color: const Color.fromARGB(255, 33, 1, 87),
                  ),
                  title: Text(
                    p.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '\$${p.price.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.green),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(id: p.id),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 33, 1, 87),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddScreen()),
          );
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("Add Product", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
