import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final _firestore = FirebaseFirestore.instance;

  Future<List<String>> getRooms() async {
    final snapshot = await _firestore.collection('rooms').get();
    return snapshot.docs.map((doc) => doc['name'].toString()).toList();
  }

  Future<void> saveRoute(String from, String to) async {
    await _firestore.collection('routes').add({
      'from': from,
      'to': to,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
