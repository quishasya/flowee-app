import 'package:flowee_app/data/dummy_data.dart';
import 'package:flowee_app/models/flower.dart';
import 'package:flowee_app/screens/detail_screen.dart';
import 'package:flowee_app/widgets/flower_card.dart';
import 'package:flowee_app/widgets/home_content_header.dart';
import 'package:flowee_app/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _query = '';
  String _selectedCategory = 'Semua';

// method getter. untuk mendapatkan data dari private class/atribut
  List<String> get _categories {
    final unique = <String>{'Semua', ...dummyFlowers.map((f) => f.category)};
    return unique.toList();
  }

  List<Flower> get _filteredFlowers {
    return dummyFlowers.where((flower) {
      // ngasih tau misal ketika user ngetik lowercase masih bisa dicari.
      final matchesQuery = flower.name.toLowerCase().contains(_query.toLowerCase());
      // menampilkan card bunga sesuai kategori yg dipilih
      final matchesCategory = _selectedCategory == 'Semua' || flower.category == _selectedCategory;
      return matchesQuery && matchesCategory;
    }).toList();
  }

  // action ketika user klik card bunga, langsung navigasi ke screen detail
  void _openDetail(Flower flower) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => DetailScreen(flower: flower)));
  }

  @override
  Widget build(BuildContext context) {
    final flowers = _filteredFlowers;
    
    return SafeArea(
      child: CustomScrollView(
        // perantara/adapter antara widget ke customScrollView, ibarat ratu dan rakyat (harus ada perantara)
        slivers: [
          SliverToBoxAdapter(
            child: HomeContentHeader(
              selectedCategory: _selectedCategory, 
              categories: _categories, 
              // membaca apakah dia true/false
              onQueryChanged: (value) => setState(() => _query = value), 
              // _selectedCategory mengikuti value
              onCategorySelected: (value) => setState(() => _selectedCategory = value),
            )
          ),
          // jika bunga gaada di data maka screen gabisa di scroll, hanya menampilkan text
          if (flowers.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text('Bunga Tidak Ditemukan'),
              ),
            )
          else 
            SliverPadding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 100),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.68
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => FlowerCard(
                    flower: flowers[index], 
                    onTap: () => _openDetail(flowers[index]),
                  ),
                  childCount: flowers.length
                ), 
              ),
            )
        ],
      ),
    );
  }
}