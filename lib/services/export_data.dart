import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// class Export_data {
//   Future<List<Map<String, dynamic>>> fetchDataFromFirestore() async {
//     try {
//       final QuerySnapshot<Map<String, dynamic>> snapshot =
//           await FirebaseFirestore.instance.collection('history').get();

//       final List<Map<String, dynamic>> data =
//           snapshot.docs.map((doc) => doc.data()).toList();

//       return data;
//     } catch (e) {
//       // Handle any potential errors
//       print('Error fetching data from Firestore: $e');
//       return [];
//     }
//   }

//   Future exportDataToExcel(data) async {
//     final excel = Excel.createExcel();
//     final sheet = excel['Sheet1'];
//     // Set the column headers
//     sheet.appendRow([
//       'Date',
//       // 'Start Percentage',
//       // 'Finish Percentage',
//       'Percentage Consumed'
//     ]);
//     // Add data rows
//     for (final item in data) {
//       final date = item['date'].toString();
//       // final startPercentage = item['start_percentage'].toString();
//       // final finishPercentage = item['finish_percentage'].toString();
//       final consumedPercentage = item['consumed_percentage'].toString();
//       sheet.appendRow(
//           //[date, startPercentage, finishPercentage, consumedPercentage]);
//           [date, consumedPercentage]);
//     }
//     // Save the workbook to a file
//     await excel.save(fileName: 'exported_data.xlsx');
//   }
// }
class ExportData {
  // Future<List<Map<String, dynamic>>> fetchDataFromFirestore() async {
  //   try {
  //     final QuerySnapshot<Map<String, dynamic>> snapshot =
  //         await FirebaseFirestore.instance.collection('history').get();

  //     final List<Map<String, dynamic>> data =
  //         snapshot.docs.map((doc) => doc.data()).toList();

  //     return data;
  //   } catch (e) {
  //     // Handle any potential errors
  //     print('Error fetching data from Firestore: $e');
  //     return [];
  //   }
  // }

  // Future<void> exportDataToExcel() async {
  //   final data = await fetchDataFromFirestore();
  //   final excel = Excel.createExcel();
  //   final sheet = excel['Sheet1'];
  //   // Set the column headers
  //   sheet.appendRow([
  //     'Date',
  //     // 'Start Percentage',
  //     // 'Finish Percentage',
  //     'Percentage Consumed'
  //   ]);
  //   // Add data rows
  //   for (final item in data) {
  //     final date = item['date'].toString();
  //     // final startPercentage = item['start_percentage'].toString();
  //     // final finishPercentage = item['finish_percentage'].toString();
  //     final consumedPercentage = item['consumed_percentage'].toString();
  //     sheet.appendRow(
  //         //[date, startPercentage, finishPercentage, consumedPercentage]);
  //         [date, consumedPercentage]);
  //   }
  //   // Save the workbook to a file
  //   await excel.save(fileName: 'exported_data.xlsx');
  //   print('exported_data.xlsx');
  // }
  Future<void> saveDataToJSON(List<int> data) async {
    final String fileName = 'data.json';
    // Create a directory to store the JSON file
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/$fileName');
    // Prepare the data with timestamps
    final List<Map<String, dynamic>> formattedData = [];
    final DateTime now = DateTime.now();
    for (final item in data) {
      final String timestamp = now.toString();
      final Map<String, dynamic> formattedItem = {
        'time': timestamp,
        'measurement': item,
      };
      formattedData.add(formattedItem);
    }
    // Convert the data to JSON
    final String jsonData = json.encode(formattedData);
    // Write the JSON data to the file
    await file.writeAsString(jsonData);
    print('Data saved successfully.');
    await saveDataToJSON(data);
  }
}
