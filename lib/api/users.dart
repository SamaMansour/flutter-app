/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
class Trips {
  final String messages;
  final DateTime timestamp;
  final String uid;
  final DocumentReference reference;

  Trips.fromMap(Map<String, dynamic> map, {required this.reference})
      : messages = map['messages'],
        timestamp = (map['timestamp'] as Timestamp).toDate(),
        uid = map['uid'];

  Trips.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() {
    return 'Messages{messages: $messages, timestamp: $timestamp, uid: $uid, reference: $reference}';
  }
}\\*/