import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB1thdu9Xq-BGSIHOil1q7RYlTfgRgdHyY",
            authDomain: "fir-xk7cei.firebaseapp.com",
            projectId: "firebase-xk7cei",
            storageBucket: "firebase-xk7cei.firebasestorage.app",
            messagingSenderId: "724511662675",
            appId: "1:724511662675:web:550ab94212250f92629ca6"));
  } else {
    await Firebase.initializeApp();
  }
}
