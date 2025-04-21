
import 'package:ev_charging_app/screens/root_screen.dart';
import 'package:ev_charging_app/screens/user_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';



//Google Sign in Auth Provider
class AuthProvider with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //To check user is Already sign in or not
  User? get user => _auth.currentUser;

  String? get userName => user?.displayName;
  String? get userEmail => user?.email;
  String? get userPhotoUrl => user?.photoURL;

  bool get isLoggedIn => user != null;


  //SIGN IN WITH GOOGLE
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      //Showing Loader
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      if (googleUser == null){
        Get.back();
        return;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      //Get the AccessToken
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      notifyListeners();

      //Close the loader
      Get.back();

      //Navigate to HomeScreen -> Successful Authentication
      Get.to(() => const RootScreen());

    } on PlatformException catch (e) {

      // close the loader
      Get.back();
      Get.snackbar(
        "Please Check your Internet Connectivity",
        "Connectivity Issue: ${"Please Check your Internet Connectivity"}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } catch (e) {
      print("Google Sign-In failed: $e");
    }
  }

  //Sign Out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    Get.to(() => const UserOnboarding());
    notifyListeners();
  }
}
