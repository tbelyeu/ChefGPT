import 'package:chefgpt/constants/firebase.dart';
import 'package:chefgpt/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  String collection = "users";

  void createUser({required id, required String name, required String photo}) {
    firestore.collection(collection).doc(id).set({
      "id": id,
      "name": name,
      "photo": photo,
    });
  }

  Future<UserModel> getUserById(String id) =>
      firestore.collection(collection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });

  Future<bool> doesUserExist(String id) async => firestore
      .collection(collection)
      .doc(id)
      .get()
      .then((value) => value.exists);

  Future<List<UserModel>> getAll() async =>
      firestore.collection(collection).get().then((result) {
        List<UserModel> users = [];
        for (DocumentSnapshot user in result.docs) {
          users.add(UserModel.fromSnapshot(user));
        }

        return users;
      });
}
