//* This class needs firebase's extension

// import 'package:cake/modules/product/data/models/product_firebase_model.dart';
// import 'package:cake/modules/product/domain/domain.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ProductFirebaseDatasource extends IProductDatasource {
//   final FirebaseFirestore _firestore;

//   ProductFirebaseDatasource({FirebaseFirestore? firestore})
//       : _firestore = firestore ?? FirebaseFirestore.instance;

//   @override
//   Future<List<Product>> get() async {
//     List<Product> result = [];
//     await _firestore
//         .collection('product')
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       result = querySnapshot.docs
//           .map((e) => ProductFirebaseModel.fromMap(e.data() as dynamic).toProduct())
//           .toList();
//     });
//     return result;
//   }

//   @override
//   Future<List<Product>> getRecomended() async {
//     List<Product> result = [];
//     await _firestore
//         .collection('product')
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       result = querySnapshot.docs
//           .map((e) => ProductFirebaseModel.fromMap(e.data() as dynamic).toProduct())
//           .toList();
//     });
//     return result;
//   }

//   @override
//   Future<List<Product>> search(String text) async {
//     List<Product> result = [];
//     await _firestore
//         .collection('product')
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       result = querySnapshot.docs
//           .map((e) => ProductFirebaseModel.fromMap(e.data() as dynamic).toProduct())
//           .toList();
//     });
//     return result;
//   }
// }
