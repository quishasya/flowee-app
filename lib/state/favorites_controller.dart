import 'package:flutter/material.dart';

// HANYA SYNTAX, JIKA ADA FITUR YANG MEMERLUKAN ADANYA PERUBAHAN VALUE MAKA GUNAKAN INI.
// SEPERTI ADANYA PERUBAHAN LIGHT AND DARKMODE
class FavoritesController extends ValueNotifier <Set<String>> {
  FavoritesController._() : super(<String>{});

  static final FavoritesController instance = FavoritesController._();

  bool isFavorite(String id) => value.contains(id);

  // memastikan membaca perubahan
  void toggle(String id) {
    final updated = Set<String>.from(value);
    if (!updated.remove(id)) {
      updated.add(id);
    } value = updated;
  } 
}