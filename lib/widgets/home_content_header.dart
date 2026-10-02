import 'package:flowee_app/data/dummy_data.dart';
import 'package:flowee_app/theme/app_theme.dart';
import 'package:flowee_app/widgets/banner_carousel.dart';
import 'package:flowee_app/widgets/category_chip_list.dart';
import 'package:flowee_app/widgets/home_header.dart';
import 'package:flowee_app/widgets/profile_sheet.dart';
import 'package:flowee_app/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomeContentHeader extends StatelessWidget {
  const HomeContentHeader({
    super.key,
    required this.selectedCategory,
    required this.categories,
    required this.onQueryChanged,
    required this.onCategorySelected,
  });

  final String selectedCategory;
  final List<String> categories;
  final ValueChanged<String> onQueryChanged;
  final ValueChanged<String> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              bottom: false,
              child:  HomeHeader(onProfileTap: () => showProfileSheet(context))
            ),
            const SizedBox(height: 20),
            const Text(
              'Explore\nthe Best Scent',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                height: 1.18,
              ),
            ),
            const SizedBox(height: 14),
            SearchField(onChanged: onQueryChanged),
          ],
        ),
      ),
    );
  }
}
