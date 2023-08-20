import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/firebase.dart';
import 'package:chefgpt/routing/routes.dart';
import 'package:chefgpt/services/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: constant_identifier_names
enum Provider { Google, Apple, Facebook, EmailAndPassword }

class Auth {
  User? currentUser = auth.currentUser;
  UserService userServices = UserService();

  bool userSignedIn() => (auth.currentUser != null) ? true : false;

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

  Future<UserCredential?> signInWithFacebook() async {
    // Create a new provider
    FacebookAuthProvider facebookProvider = FacebookAuthProvider();

    facebookProvider.addScope('email');
    facebookProvider.setCustomParameters({
      'display': 'popup',
    });

    // Once signed in, return the UserCredential
    try {
      return await auth.signInWithPopup(facebookProvider);
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<UserCredential?> signUpWithEmailAndPassword(
      String name, String email, String password) async {
    UserCredential? credential;

    try {
      credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      return null;
    }

    if (credential != null) {
      signIn(credential, name);
    }
    return credential;
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential? credential;

    try {
      credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      return null;
    }

    if (credential != null) {
      signIn(credential);
    }
    return credential;
  }

  Future signInWith(Provider provider) async {
    UserCredential? credential;
    switch (provider) {
      case Provider.Google:
        credential = await signInWithGoogle();
        break;
      case Provider.Apple:
        credential = await signInWithGoogle();
        break;
      case Provider.Facebook:
        credential = await signInWithFacebook();
        break;
      // case Provider.EmailAndPassword:
      //   credential = await signInWithGoogle();
      //   break;
      default:
        print("Invalid provider");
        return;
    }

    if (credential != null) {
      signIn(credential);
    }
  }

  // TODO:: better name for this method
  Future signIn(UserCredential credential, [String name = ""]) async {
    User user = credential.user!;

    if (!await userServices.doesUserExist(user.uid)) {
      userServices.createUser(
          id: user.uid,
          name: user.displayName ?? name,
          photo: user.photoURL ??
              "https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Icon-round-Question_mark.jpg/2048px-Icon-round-Question_mark.jpg");
    }

    authenticationController.userSignedIn.value = true;
    authenticationController.initUser();

    menuController.changeActiveItemTo(NewRecipePageRoute);
    navigationController.navigateTo(NewRecipePageRoute);
  }

  Future signOut() async {
    await auth.signOut();
    authenticationController.userSignedIn.value = false;
    menuController.toggleSideMenuItems();
    myRecipesController.savedRecipes.clear();
  }
}
