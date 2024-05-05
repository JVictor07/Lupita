import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCUBvZ-BfyLAmt_chlb6huYQy9_xfYihIU",
            authDomain: "lupita-6gagf5.firebaseapp.com",
            projectId: "lupita-6gagf5",
            storageBucket: "lupita-6gagf5.appspot.com",
            messagingSenderId: "120758224653",
            appId: "1:120758224653:web:e2f6f36875375618705244"));
  } else {
    await Firebase.initializeApp();
  }
}
