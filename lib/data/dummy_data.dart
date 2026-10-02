import 'package:flowee_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../models/perfume.dart';
import '../models/promo_banner.dart';

class DummyUser {
  static const String email = 'demo@osma.com';
  static const String password = 'osma123';
  static const String name = 'Demo User';
}

final List<Perfume> dummyPerfumes = [
  Perfume(
    id: 'p1',
    name: 'Amber S',
    category: 'Unisex',
    fragranceNotes: ['Amber', 'Rose', 'Musk'],
    price: 399000,
    rating: 4.9,
    description:
        'A refined unisex fragrance with a bright black currant opening, an elegant rose heart, and a warm amber base. A balanced scent with a sophisticated and memorable character.',
    imageUrl: 'https://cdn.salla.sa/YNEym/4ba99711-1dcf-4426-8045-ef94a0974f1a-1000x1000-Mr8TDT3c5hBY6KTdY5ns6cXWZUqGULGvWmO7YOOx.jpg',
    icon: Icons.local_florist,
    color: Color(0xFFC98F8F),
  ),
  Perfume(
    id: 'p2',
    name: 'Cotton C',
    category: 'Unisex',
    fragranceNotes: ['Rose', 'Woody', 'Musk'],
    price: 399000,
    rating: 4.8,
    description:
        'A soft and comforting fragrance combining red berries, Turkish rose, and warm sandalwood. Fresh, elegant, and effortless for everyday wear.',
    imageUrl: 'https://cdn.salla.sa/YNEym/ec50c9c6-e387-4312-a427-26046048d51f-1000x1000-G9evAuNBndEY7HbDo7zZwnomSS0306UFD3VMYcRJ.jpg',
    icon: Icons.spa,
    color: Color(0xFFD8D2C4),
  ),
  Perfume(
    id: 'p3',
    name: 'Citrus F',
    category: 'Unisex',
    fragranceNotes: ['Fruity', 'Rose', 'Musk'],
    price: 399000,
    rating: 4.8,
    description:
        'A fresh and clean fragrance with bright citrus notes, a soft rose heart, and a smooth white musk base. Perfect for daytime and everyday wear.',
    imageUrl: 'https://cdn.salla.sa/YNEym/7039bf7c-350b-4dbe-9342-13f2aa9f9157-1000x1000-Nvfrk0784ObDAqz681cXHVVodPOZ1V6vddX82qQi.jpg',
    icon: Icons.wb_sunny_outlined,
    color: Color(0xFFE6D98C),
  ),
  Perfume(
    id: 'p4',
    name: 'Paudree F',
    category: 'Women',
    fragranceNotes: ['Rose', 'Musk', 'Powdery'],
    price: 399000,
    rating: 4.7,
    description:
        'A soft powdery fragrance built around rose and musk. Delicate, elegant, and sophisticated with a smooth and feminine character.',
    imageUrl: 'https://cdn.files.salla.network/products/465941588/43bae998-08b6-4a19-a8ba-8e5073463c8f_900x900.webp',
    icon: Icons.local_florist,
    color: Color(0xFFD9B8B8),
  ),
  Perfume(
    id: 'p5',
    name: 'White F',
    category: 'Unisex',
    fragranceNotes: ['Fruity', 'Floral', 'Musk'],
    price: 399000,
    rating: 4.8,
    description:
        'A lively fragrance that combines fruity black currant with elegant orange blossom and a warm maltol base. Fresh, soft, and easy to wear.',
    imageUrl: 'https://cdn.salla.sa/YNEym/5d644ee4-273d-40b9-899d-48f1e260e147-1000x1000-Ks8ZwYn8ZdZ4v7Zb4Koe3edmP23LSrWdY8cD0nQr.jpg',
    icon: Icons.auto_awesome,
    color: Color(0xFFE8E4D8),
  ),
  Perfume(
    id: 'p6',
    name: 'Ambry A',
    category: 'Unisex',
    fragranceNotes: ['Amber', 'Woody', 'Musk'],
    price: 399000,
    rating: 4.7,
    description:
        'An oriental-inspired fragrance with a warm and modern character. Designed for those who enjoy rich and distinctive scents.',
    imageUrl: 'https://cdn.salla.sa/YNEym/b6890300-5129-4009-bae3-4e2bd8d728dc-1000x1000-ZT1VKDn9LaIuSfRulNIrXNAaDUPfI7Qfkh1kVnPN.jpg',
    icon: Icons.whatshot_outlined,
    color: Color(0xFFB98B68),
  ),
  Perfume(
    id: 'p7',
    name: 'Woody W',
    category: 'Unisex',
    fragranceNotes: ['Woody', 'Amber', 'Leather'],
    price: 399000,
    rating: 4.9,
    description:
        'A distinctive woody fragrance opening with fresh bergamot, followed by warm maltol and a rich leather base. Refined, bold, and memorable.',
    imageUrl: 'https://cdn.salla.sa/YNEym/92cc4b63-404c-4e69-b961-e2b8521f88a0-1000x1000-LG6P8yOx94fAHpZcZQKlN8tsguhPsSGkIlxVaKMO.jpg',
    icon: Icons.park_outlined,
    color: Color(0xFF9A8065),
  ),
  Perfume(
    id: 'p8',
    name: 'Woody F',
    category: 'Unisex',
    fragranceNotes: ['Woody', 'Amber', 'Fruity'],
    price: 399000,
    rating: 4.8,
    description:
        'A rich fragrance that opens with fresh pineapple, develops into a leathery heart, and settles into a warm amber base.',
    imageUrl: 'https://osmaperfumes.com/en/woody-f/p972460472',
    icon: Icons.park,
    color: Color(0xFF9E7754),
  ),
  Perfume(
    id: 'p9',
    name: 'Floral A',
    category: 'Unisex',
    fragranceNotes: ['Floral', 'Woody', 'Musk'],
    price: 399000,
    rating: 4.8,
    description:
        'A clean floral woody fragrance with fresh ginger, soft orange blossom, and a creamy sandalwood base. Elegant and suitable from day to evening.',
    imageUrl: 'https://osmaperfumes.com/en/Floral-A/p334271795',
    icon: Icons.local_florist,
    color: Color(0xFFD5B6A3),
  ),
  Perfume(
    id: 'p10',
    name: 'Osma S',
    category: 'Unisex',
    fragranceNotes: ['Floral', 'Woody', 'Musk'],
    price: 599000,
    rating: 4.9,
    description:
        'A refined fragrance combining vibrant pink pepper, elegant Sambac jasmine, and smooth sandalwood. Fresh, floral, warm, and versatile.',
    imageUrl: 'https://osmaperfumes.com/en/osma-s-perfume-150ml/p2131961702',
    icon: Icons.auto_awesome,
    color: Color(0xFFB8A28D),
  ),
  Perfume(
    id: 'p11',
    name: 'Osma O',
    category: 'Unisex',
    fragranceNotes: ['Fruity', 'Tobacco', 'Musk'],
    price: 599000,
    rating: 4.8,
    description:
        'A distinctive fragrance with a refreshing pear opening, a sophisticated tobacco heart, and a warm musk base.',
    imageUrl: 'https://osmaperfumes.com/en/o/p201096472',
    icon: Icons.nightlife_outlined,
    color: Color(0xFF806B5A),
  ),
  Perfume(
    id: 'p12',
    name: 'Osma A',
    category: 'Unisex',
    fragranceNotes: ['Fruity', 'Vanilla', 'Woody'],
    price: 599000,
    rating: 4.8,
    description:
        'A tropical fragrance combining sweet pineapple, creamy coconut, and a soft vanilla base. Warm, smooth, and perfect for sunny days.',
    imageUrl: 'https://osmaperfumes.com/en/a/p1065610670',
    icon: Icons.beach_access_outlined,
    color: Color(0xFFD7B878),
  ),
  Perfume(
    id: 'p13',
    name: 'Bonsoir',
    category: 'Unisex',
    fragranceNotes: ['Woody', 'Leather', 'Amber'],
    price: 599000,
    rating: 4.9,
    description:
        'A sophisticated fragrance opening with grapefruit, developing into a bold leather heart, and finishing with warm cedarwood.',
    imageUrl:
        'https://osmaperfumes.com/en/%D8%B9%D8%B7%D8%B1-%D8%A8%D9%88%D9%86%D8%B3%D9%88%D8%A7%D8%B1-150-%D9%85%D9%84/p324344167',
    icon: Icons.nightlight_outlined,
    color: Color(0xFF76665C),
  ),
];

final List<String> fragranceNotes = [
  'Musk',
  'Woody',
  'Amber',
  'Rose',
  'Vanilla',
  'Fruity',
];

final List<PromoBanner> dummyBanners = [
  PromoBanner(
    title: 'National Day Offers',
    subtitle: 'Discover exclusive fragrances and special offers',
    imageUrl: 'https://cdn.files.salla.network/homepage/465941588/b0bb81e1-9958-4f76-84ef-26768b5edee4-original.webp',
    gradientColors: [
      AppTheme.primary,
      AppTheme.primaryDark,
    ],
  ),
  PromoBanner(
    title: '96 Vibe',
    subtitle: 'Two fragrances. Two moods. One signature experience.',
    imageUrl: 'https://cdn.files.salla.network/homepage/465941588/b9e93ed9-c37a-4596-9218-1b06a98fb5c7-original.webp',
    gradientColors: const [
      AppTheme.primary,
      AppTheme.primaryDark,
    ],
  ),
  PromoBanner(
    title: '96 Picks',
    subtitle: 'Paudree F meets Citrus F in one signature bundle',
    imageUrl: 'https://cdn.files.salla.network/homepage/465941588/009c8d70-aff9-41b5-92c6-245a6e43c0c5-original.webp',
    gradientColors: const [
      Color(0xFFA9A2CD),
      Color(0xFF43478F),
    ],
  ),
];