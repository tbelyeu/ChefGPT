import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/firebase.dart';
import 'package:chefgpt/routing/routes.dart';
import 'package:chefgpt/services/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: constant_identifier_names
enum Provider { Google, Apple, Facebook, Email }

class Auth {
  User? currentUser = auth.currentUser;
  UserServices userServices = UserServices();

  Future<UserCredential?> signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    // googleProvider
    //     .addScope('https://www.googleapis.com/auth/contacts.readonly');
    // googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // Once signed in, return the UserCredential
    try {
      return await auth.signInWithPopup(googleProvider);
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future signIn(Provider provider) async {
    UserCredential? credential;
    switch (provider) {
      case Provider.Google:
        credential = await signInWithGoogle();
        break;
      case Provider.Apple:
        credential = await signInWithGoogle();
        break;
      case Provider.Facebook:
        credential = await signInWithGoogle();
        break;
      case Provider.Email:
        credential = await signInWithGoogle();
        break;
      default:
        print("Invalid provider");
        return;
    }

    if (credential != null) {
      User user = credential.user!;

      if (!await userServices.doesUserExist(user.uid)) {
        userServices.createUser(
            id: user.uid, name: user.displayName!, photo: user.photoURL!);
      }

      authenticationController.userSignedIn.value = true;
      authenticationController.initUser();

      menuController.changeActiveItemTo(NewRecipePageRoute);
      navigationController.navigateTo(NewRecipePageRoute);
    }
  }

  Future signOut() async {
    // TODO: confirmation popup
    await auth.signOut();
    authenticationController.userSignedIn.value = false;
    menuController.toggleSideMenuItems();
  }
}
