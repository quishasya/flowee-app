import 'package:flowee_app/data/dummy_data.dart';
import 'package:flowee_app/screens/detail_screen.dart';
import 'package:flowee_app/state/favorites_controller.dart';
import 'package:flowee_app/widgets/empty_favorite_state.dart';
import 'package:flowee_app/widgets/perfume_card.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3157A8),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 16, 20, 20),
              child: Text(
                'Your Cart',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF7F9FC),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),

                child: ValueListenableBuilder<Set<String>>(
                  valueListenable: FavoritesController.instance,

                  builder: (context, favoriteIds, _) {
                    final favoritePerfume = dummyPerfumes
                        .where((perfume) => favoriteIds.contains(perfume.id))
                        .toList();
                    if (favoritePerfume.isEmpty) {
                      return const EmptyFavoriteState();
                    }
                    SizedBox(
                      height: 360,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 20),
                        itemCount: favoritePerfume.length,
                        itemBuilder: (context, index) {
                          final perfume = favoritePerfume[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              right: index == favoritePerfume.length - 1
                                  ? 20
                                  : 14,
                            ),
                            child: SizedBox(
                              width: 300,
                              child: PerfumeCard(
                                perfume: perfume,
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          DetailScreen(perfume: perfume),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                    return GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 18, 16, 100),

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 10,
                          ),

                      itemCount: favoritePerfume.length,

                      itemBuilder: (context, index) {
                        final perfume = favoritePerfume[index];

                        return PerfumeCard(
                          perfume: perfume,

                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => DetailScreen(perfume: perfume),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
