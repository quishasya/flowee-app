import 'package:flutter/material.dart';

class EmptyFavoriteState extends StatelessWidget {
  const EmptyFavoriteState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey.shade300),
          SizedBox(height: 12),
          Text(
            'Cart is Still Empty',
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
          Text(
            'Go Discover your Favorite Perfume',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 12
            ),
          )
        ],
      ),
    );
  }
}