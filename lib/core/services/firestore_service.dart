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
      // استخدم await هنا لضمان انتهاء العملية قبل الانتقال للسطر التالي
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String docuementId,
  }) async {
    // التحقق من وجود الوثيقة في Firestore
    var data = await firestore.collection(path).doc(docuementId).get();
    return data.exists;
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? docuementId,
    Map<String, dynamic>? query,
  }) async {
    if (docuementId != null) {
      // جلب بيانات وثيقة محددة
      var data = await firestore.collection(path).doc(docuementId).get();
      return data.data();
    }
    // يمكنك لاحقاً تطوير الجزء الخاص بالـ Query هنا
    return null;
  }
}
