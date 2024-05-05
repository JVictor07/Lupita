import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class DatesRecord extends FirestoreRecord {
  DatesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "answers" field.
  List<String>? _answers;
  List<String> get answers => _answers ?? const [];
  bool hasAnswers() => _answers != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _answers = getDataList(snapshotData['answers']);
    _userId = snapshotData['userId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dates');

  static Stream<DatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DatesRecord.fromSnapshot(s));

  static Future<DatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DatesRecord.fromSnapshot(s));

  static DatesRecord fromSnapshot(DocumentSnapshot snapshot) => DatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDatesRecordData({
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class DatesRecordDocumentEquality implements Equality<DatesRecord> {
  const DatesRecordDocumentEquality();

  @override
  bool equals(DatesRecord? e1, DatesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.answers, e2?.answers) &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(DatesRecord? e) =>
      const ListEquality().hash([e?.answers, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is DatesRecord;
}
