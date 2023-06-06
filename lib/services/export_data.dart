import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';

class Export_data {
  Future<List<Map<String, dynamic>>> fetchDataFromFirestore() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('history').get();

      final List<Map<String, dynamic>> data =
          snapshot.docs.map((doc) => doc.data()).toList();

      return data;
    } catch (e) {
      // Handle any potential errors
      print('Error fetching data from Firestore: $e');
      return [];
    }
  }

  Future exportDataToExcel(data) async {
    final excel = Excel.createExcel();
    final sheet = excel['Sheet1'];
    // Set the column headers
    sheet.appendRow([
      'Date',
      // 'Start Percentage',
      // 'Finish Percentage',
      'Percentage Consumed'
    ]);
    // Add data rows
    for (final item in data) {
      final date = item['date'].toString();
      // final startPercentage = item['start_percentage'].toString();
      // final finishPercentage = item['finish_percentage'].toString();
      final consumedPercentage = item['consumed_percentage'].toString();
      sheet.appendRow(
          //[date, startPercentage, finishPercentage, consumedPercentage]);
          [date, consumedPercentage]);
    }
    // Save the workbook to a file
    await excel.save(fileName: 'exported_data.xlsx');
  }
}
