import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:widget_space/core/services/database_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String docuementId,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? docuementId,
    Map<String, dynamic>? query,
  }) {
    throw UnimplementedError();
  }
}
