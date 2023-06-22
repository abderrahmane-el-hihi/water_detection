import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class ExportData {
  Future<void> exportCollectionToExcel(String collectionName) async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection(collectionName).get();

    if (snapshot.docs.isNotEmpty) {
      final Excel excel = Excel.createExcel();
      final Sheet sheet = excel['Sheet1'];

      // Add column headers
      final List<String> columnHeaders =
          (snapshot.docs.first.data() as Map<String, dynamic>).keys.toList();
      for (var i = 0; i < columnHeaders.length; i++) {
        sheet
            .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0))
            .value = columnHeaders[i];
      }

      // Add document data
      for (var i = 0; i < snapshot.docs.length; i++) {
        final Map<String, dynamic> data =
            snapshot.docs[i].data() as Map<String, dynamic>;
        final List<dynamic> values = data.values.toList();

        for (var j = 0; j < values.length; j++) {
          sheet
              .cell(CellIndex.indexByColumnRow(columnIndex: j, rowIndex: i + 1))
              .value = values[j];
        }
      }

      // Save the Excel file
      final Directory appDocumentsDirectory =
          await getApplicationDocumentsDirectory();
      final String filePath = 'Download/file.xlsx';
      final List<int>? excelBytes = excel.encode();
      final File file = File(filePath);
      file.createSync(recursive: true);
      file.writeAsBytesSync(excelBytes!, flush: true);
      OpenFile.open(filePath);
      print('Excel file exported successfully!');
    } else {
      print('No documents found in the collection.');
    }
  }
}
