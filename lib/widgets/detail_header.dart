import 'package:flowee_app/models/perfume.dart';
import 'package:flowee_app/state/favorites_controller.dart';
import 'package:flowee_app/theme/app_theme.dart';
import 'package:flowee_app/widgets/circle_icon_button.dart';
import 'package:flowee_app/widgets/perfume_network_image.dart';
import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key, required this.perfume, required this.onBack});

  final Perfume perfume;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleIconButton(
                    icon: Icons.arrow_back_rounded,
                    iconColor: Colors.black87,
                    onTap: onBack,
                  ),
                  SizedBox(width: 120),
                  Center(
                    child: Text(
                      'Detail',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: Hero(
              tag: 'perfume-image-${perfume.id}',
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20,),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withValues(alpha: 0.4),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.4),
                    width: 10,
                  ),
                  boxShadow: [BoxShadow(
                    color: AppTheme.primarySoft.withValues(alpha: 0.2),
                    offset: Offset(0, 2),
                    blurRadius: 8
                  )] ,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: PerfumeNetworkImage(
                    imageUrl: perfume.imageUrl,
                    fallbackIcon: perfume.icon,
                    fallbackColor: perfume.color,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({required this.perfumeId});

  final String perfumeId;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<String>>(
      // didengar oleh valueNotifier melalui class FavoritesController
      valueListenable: FavoritesController.instance,
      builder: (context, favoritesId, _) {
        final isFavorite = favoritesId.contains(perfumeId);

        return CircleIconButton(
          icon: isFavorite
              ? Icons.favorite_rounded
              : Icons.favorite_border_rounded,
          iconColor: isFavorite ? Colors.pink : Colors.black87,
          onTap: () => FavoritesController.instance.toggle(perfumeId),
        );
      },
    );
  }
}
