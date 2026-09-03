import 'dart:async';

import 'package:flowee_app/models/promo_banner.dart';
import 'package:flowee_app/widgets/banner_slide.dart';
import 'package:flowee_app/widgets/carousel_dots.dart';
import 'package:flutter/material.dart';

// Carousel Banner akan bergeser otomatis setiap beberapa detik,
// untuk handling timer seperti ini, kita butuh peran StatefulWidget untuk melakukan perubahan widget pada layar
class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key, required this.banners});

  final List<PromoBanner> banners;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  /**
   * PageController --> mengatur slide mana yang sedang tampil di PageView
   */

  late final PageController _controller = PageController();
  Timer? _timer;
  int _page = 0;

  // initState --> initial state, kondisi awal sebelum adanya perubahan
  @override
  void initState() {
    super.initState(); //mengatur state awal seblum adanya perubahan
    // Timer.periodic --> menjalankan fungsi didalamnya secara berulang - ulang
    _timer = Timer.periodic(Duration(seconds: 4), (_) {
      // pengecekan apakah widgetnya tidak ready (!mounted) atau empty (isEmpty)
      if (!mounted || widget.banners.isEmpty) return;
      // untuk menghitung/nambah index tetapi tetap sesuai dgn data banner yg kita miliki
      final next = (_page + 1) % widget.banners.length;
      // _controller --> geser banner 1 ke yang lainnya dengan durasi 500ms
      _controller.animateToPage(
        next,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  /**
   * Timer HARUS di cancel saat widget dihancurkan (tidak tampil di layar), kalo lupa timer akan 
   * terus mencoba jalan di background, walau carouselnya sudah tidak muncul di layar
   * ini salah satu penyebab umum memory leak di Flutter
   * 
   * Menghentikan sebuah proses jika sudah tidak tampil di layar
   */
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox.shrink();
    return Column(
      children: [
        SizedBox(
          height: 168,
          child: PageView.builder( //PageView.builder function yg menentukan halaman bisa memiliki interaksi
            controller: _controller,
            itemCount: widget.banners.length, //manggil semua data yg ada pada class banners itemCount -> berapa banyak data yg mau ditampilin
            /**
             * Ketika user melakukan action Swiping
             * 
             * Dipanggil juga saat pengguna swipe manual, bukan cuma saat digeser 
             * otomatis oleh timer, supaya titik indikator dibawah selalu sinkron 
             * dengan slide yg benar benar tampil
             * 
             * setState() --> state ketika sudah memiliki perubahan dalam page, dipanggil 
             * saat adanya perubahan widget, dan akan memberi tahu Flutter
             */
            onPageChanged: (index) => setState(() => _page = index),
            //menampilkan data data yg ada di banner dan di urutin berdasarkan index
            itemBuilder: (context, index) => BannerSlide(banner: widget.banners[index]),
          ),
        ),
        SizedBox(height: 10),
        CarouselDots(
          count: widget.banners.length, 
          activeIndex: _page, 
          activeColor: widget.banners[_page].gradientColors.first,
        )
      ],
    );
  }
}