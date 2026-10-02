import 'package:flowee_app/models/perfume.dart';
import 'package:flowee_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProductSummary extends StatelessWidget {
  const ProductSummary({super.key, required this.perfume});

  final Perfume perfume;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CategoryBadge(text: perfume.category),
              SizedBox(height: 10,),
              Text(
                perfume.name,
                style: AppTheme.display(fontSize: 24),
              )
            ],
          )
        ),
        _RatingBadge(rating: perfume.rating)        
      ],
    );
  }
}

class _CategoryBadge extends StatelessWidget {
  const _CategoryBadge({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.primarySoft,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppTheme.primary,
          fontSize: 14,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  const _RatingBadge({required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.amber.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(14)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded, size: 18, color: Colors.amber),
          SizedBox(width: 3),
          Text(
            rating.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          )
        ],
      ),
    );
  }
}