import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeModel {
  static const TITLE = "title";
  static const INGREDIENTS = "ingredients";
  static const INSTRUCTIONS = "instructions";

  late String _title;
  late List<String> _ingredients;
  late List<String> _instructions;

  // getters
  String get title => _title;
  List<String> get ingredients => _ingredients;
  List<String> get instructions => _instructions;

  RecipeModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    _title = data[TITLE];
    _ingredients = data[INGREDIENTS].whereType<String>().toList();
    _instructions = data[INSTRUCTIONS].whereType<String>().toList();
  }

  RecipeModel(
      {required String title,
      required List<String> ingredients,
      required List<String> instructions}) {
    _title = title;
    _ingredients = ingredients;
    _instructions = instructions;
  }
}
