// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future returnConcatenedArrayAnswer() async {
  // make a firebase request in a collection called dates and concatened all array answer results
// Define the Firestore instance and collection
  final firestoreInstance = FirebaseFirestore.instance;
  final collectionRef = firestoreInstance.collection('dates');

  // Make the request to Firestore
  final querySnapshot = await collectionRef.get();

  // Concatenate all array answer results
  List<String> concatenatedResults = [];
  querySnapshot.docs.forEach((doc) {
    final answers = doc.data()['answers'];
    concatenatedResults.addAll(answers);
  });

  // Return the concatenated results
  return concatenatedResults;
}
