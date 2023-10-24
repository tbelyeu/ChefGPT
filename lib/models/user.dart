import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const PHOTO = "photo";

  late String _id;
  late String _name;
  late String _photo;

  // getters
  String get id => _id;
  String get name => _name;
  String get photo => _photo;

  UserModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    _id = data[ID];
    _name = data[NAME];
    _photo = data[PHOTO];
  }

  UserModel() {
    _id = "placeholder";
    _name = "placeholder";
    _photo =
        "https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Icon-round-Question_mark.jpg/2048px-Icon-round-Question_mark.jpg";
  }
}
