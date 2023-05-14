import 'package:cloud_firestore/cloud_firestore.dart';

class Firebase_db {
  Write_Data(String Collection_name, Map<String, dynamic> Data) {
    CollectionReference Collection =
        FirebaseFirestore.instance.collection(Collection_name);
    Collection.add(Data).then((DocumentReference docRef) {
      print('Document added with ID: ${docRef.id}');
    }).catchError((error) {
      print('Error adding document: $error');
    });
  }
}
