import 'package:cake/modules/cake/data/models/cake_firebase_model.dart';
import 'package:cake/modules/cake/domain/domain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CakeFirebaseDatasource extends ICakeDatasource {
  final FirebaseFirestore _firestore;

  CakeFirebaseDatasource({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<List<Cake>> get() async {
    List<Cake> result = [];
    await _firestore
        .collection('cake')
        .get()
        .then((QuerySnapshot querySnapshot) {
      result = querySnapshot.docs
          .map((e) => CakeFirebaseModel.fromMap(e.data() as dynamic).toCake())
          .toList();
    });
    return result;
  }
}
