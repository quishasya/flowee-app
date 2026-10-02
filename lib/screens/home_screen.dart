import 'package:flowee_app/data/dummy_data.dart';
import 'package:flowee_app/models/perfume.dart';
import 'package:flowee_app/screens/detail_screen.dart';
import 'package:flowee_app/widgets/banner_carousel.dart';
import 'package:flowee_app/widgets/category_chip_list.dart';
import 'package:flowee_app/widgets/perfume_card.dart';
import 'package:flowee_app/widgets/home_content_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _query = '';
  String _selectedCategory = 'All';

  List<String> get _categories {
    final unique = <String>{
      'All',
      ...dummyPerfumes.map((perfume) => perfume.category),
    };

    return unique.toList();
  }

  List<Perfume> get _filteredPerfume {
    return dummyPerfumes.where((perfume) {
      final matchesQuery = perfume.name.toLowerCase().contains(
        _query.toLowerCase(),
      );

      final matchesCategory =
          _selectedCategory == 'All' || perfume.category == _selectedCategory;

      return matchesQuery && matchesCategory;
    }).toList();
  }

  void _openDetail(Perfume perfume) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => DetailScreen(perfume: perfume)));
  }

  @override
  Widget build(BuildContext context) {
    final perfumes = _filteredPerfume;

    return Scaffold(
      backgroundColor: const Color(0xFF3157A8),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HomeContentHeader(
              selectedCategory: _selectedCategory,
              categories: _categories,
              onQueryChanged: (value) {
                setState(() {
                  _query = value;
                });
              },
              onCategorySelected: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF7F9FC),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 28, bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 0, 0, 10),
                      child: CategoryChipList(
                        categories: _categories,
                        selectedCategory: _selectedCategory,
                        onSelected: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 18),
                    if (perfumes.isEmpty)
                      SizedBox(
                        height: 250,
                        child: Center(
                          child: Text(
                            'Perfume does not exist',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                      )
                    else
                      SizedBox(
                        height: 370,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(left: 20),
                          itemCount: perfumes.length,
                          itemBuilder: (context, index) {
                            final perfume = perfumes[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                right: index == perfumes.length - 1 ? 20 : 14,
                              ),
                              child: SizedBox(
                                width: 300,
                                child: PerfumeCard(
                                  perfume: perfume,
                                  onTap: () {
                                    _openDetail(perfume);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Best Offers',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: BannerCarousel(banners: dummyBanners),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
