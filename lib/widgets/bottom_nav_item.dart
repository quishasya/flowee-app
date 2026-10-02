import 'package:flowee_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedScale(
        scale: selected ? 1.0 : 0.94,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          width: 58,
          height: 58,
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selected
                ? AppTheme.primary
                : Colors.white,
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: AppTheme.primary.withValues(
                        alpha: 0.28,
                      ),
                      blurRadius: 16,
                      spreadRadius: 1,
                      offset: const Offset(0, 7),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: 0.04,
                      ),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
          ),
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              switchInCurve: Curves.easeOutBack,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
              ) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Icon(
                icon,
                key: ValueKey(selected),
                size: 24,
                color: selected
                    ? Colors.white
                    : const Color(0xFF252525),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
