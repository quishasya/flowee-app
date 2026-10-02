import 'package:flowee_app/models/perfume.dart';
import 'package:flowee_app/theme/app_theme.dart';
import 'package:flowee_app/widgets/detail_header.dart';
import 'package:flowee_app/widgets/detail_total.dart';
import 'package:flowee_app/widgets/perfume_network_image.dart';
import 'package:flowee_app/widgets/product_summary.dart';
import 'package:flowee_app/widgets/quantity_stepper.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.perfume});

  final Perfume perfume;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // nilai ini "hidup" selama widget state ini ada, setiap kali diubah oleh SetState
  // Flutter akan melakukan rebuild supaya tampilan ikut terupdate
  int _quantity = 1;

  // adanya perubahan state ketika adanya perubahan saat function increment/decrement dijalankan
  void _increment() => setState(() => _quantity++);

  void _decrement() {
    if (_quantity > 1) {
      setState(() => _quantity--);
    }
  }

  void _addToCart() {
    final flower = widget.perfume;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$_quantity x ${flower.name} added to Cart'),
      ),
    );
  }

  @override
Widget build(BuildContext context) {
  final perfume = widget.perfume;

  return Scaffold(
    backgroundColor: AppTheme.primary,

    body: Column(
      children: [
        const SizedBox(height: 8),
        DetailHeader(
          perfume: perfume,
          onBack: () => Navigator.of(context).pop(),
        ),

        Expanded(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFF8FAFF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(38),
                topRight: Radius.circular(38),
              ),
            ),

            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    30,
                    16,
                    30,
                    180, // ruang untuk tombol bawah
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 42,
                          height: 4,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD5DCE9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      ProductSummary(
                        perfume: perfume,
                      ),

                      const SizedBox(height: 18),

                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                        ),
                      ),

                      const SizedBox(height: 7),

                      Text(
                        perfume.description,
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                          height: 1.45,
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 14),

                      QuantityStepper(
                        quantity: _quantity,
                        onIncrement: _increment,
                        onDecrement: _decrement,
                      ),

                      const SizedBox(height: 25),
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 90,
                  child: FloatingActionButton.extended(
                    onPressed: _addToCart,
                    backgroundColor: AppTheme.primary,
                    foregroundColor: Colors.white,
                    elevation: 2,
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      size: 20,
                    ),
                    label: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: DetailTotalBar(
                    totalPrice:
                        perfume.price.toDouble() * _quantity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
}
