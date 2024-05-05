import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class AnswersRecord extends FirestoreRecord {
  AnswersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  bool hasValue() => _value != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _value = snapshotData['value'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _date = snapshotData['date'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('answers');

  static Stream<AnswersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnswersRecord.fromSnapshot(s));

  static Future<AnswersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnswersRecord.fromSnapshot(s));

  static AnswersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnswersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnswersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnswersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnswersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnswersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnswersRecordData({
  String? category,
  String? value,
  DateTime? timestamp,
  String? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
      'value': value,
      'timestamp': timestamp,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnswersRecordDocumentEquality implements Equality<AnswersRecord> {
  const AnswersRecordDocumentEquality();

  @override
  bool equals(AnswersRecord? e1, AnswersRecord? e2) {
    return e1?.category == e2?.category &&
        e1?.value == e2?.value &&
        e1?.timestamp == e2?.timestamp &&
        e1?.date == e2?.date;
  }

  @override
  int hash(AnswersRecord? e) =>
      const ListEquality().hash([e?.category, e?.value, e?.timestamp, e?.date]);

  @override
  bool isValidKey(Object? o) => o is AnswersRecord;
}
