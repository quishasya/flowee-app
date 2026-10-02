import 'package:flowee_app/models/perfume.dart';
import 'package:flowee_app/state/favorites_controller.dart';
import 'package:flowee_app/theme/app_theme.dart';
import 'package:flowee_app/widgets/perfume_network_image.dart';
import 'package:flutter/material.dart';

class PerfumeCard extends StatelessWidget {
  const PerfumeCard({super.key, required this.perfume, required this.onTap});

  final Perfume perfume;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppTheme.primary.withValues(alpha: 0.60), width: 4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppTheme.primary, width: 1.2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23),
                child: Hero(
                  tag: 'flower-image-${perfume.id}',
                  child: PerfumeNetworkImage(
                    imageUrl: perfume.imageUrl,
                    fallbackIcon: perfume.icon,
                    fallbackColor: perfume.color,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    perfume.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),
                SizedBox(width: 6),
                Icon(Icons.star_rounded, size: 22, color: Colors.amber),
                SizedBox(width: 3),
                Text(
                  perfume.rating.toString(),
                  style: TextStyle(fontSize: 16, color: AppTheme.primary),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(
              perfume.fragranceNotes.join(' · '),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondary,
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primarySoft,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    formatRupiah(perfume.price.toDouble()),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryDark,
                    ),
                  ),
                ),
                Spacer(),
                ValueListenableBuilder<Set<String>>(
                  valueListenable: FavoritesController.instance,
                  builder: (context, favorites, _) {
                    final isInCart = favorites.contains(perfume.id);
                    return InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        FavoritesController.instance.toggle(perfume.id);
                      },
                      child: Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          color: AppTheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isInCart ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                    );
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
