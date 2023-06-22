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

  Get_data_on_date() async {
    late List<int> mesures;
    DateTime endDate = DateTime.now();
    DateTime startDate = endDate.subtract(Duration(days: 7));
    CollectionReference collection =
        FirebaseFirestore.instance.collection('history');
    Query query = collection
        .where('date', isGreaterThanOrEqualTo: startDate)
        .where('date', isLessThanOrEqualTo: endDate)
        .limit(7);
    QuerySnapshot querySnapshot = await query.get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    for (QueryDocumentSnapshot document in documents) {
      mesures = document.data() as List<int>;
    }
    return mesures;
  }
}
