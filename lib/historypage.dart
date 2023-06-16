import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:waterdetection/components/l_button.dart';
import 'package:waterdetection/home2page.dart';
import 'package:waterdetection/settingspage.dart';
import 'components/graph_bar/graphbar.dart';
import 'services/connect_to_arduino.dart';
import 'services/export_data.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List SummaryWaterDb = [];
  int receivedNumber = 0;
  late connect_to_server numberReceiver;
  void connect() {
    numberReceiver.connectToServer((number) {
      setState(() {
        receivedNumber = number;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    numberReceiver = connect_to_server('192.168.11.159', 54900);
    connect();
  }

  // void fetchData() async {
  //   List<Map<String, dynamic>> dataList =
  //       await ExportData().fetchDataFromFirestore();
  //   print(dataList);
  // }
  List<int> data = [];
  FillDataList() {
    for (var i = 0; i < 5; i++) {
      data.add(receivedNumber);
    }
    print(data.toString());
  }

  //List<Map<String, dynamic>> data = await Export_data().fetchDataFromFirestore();
  void PickDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2036),
      // builder: (BuildContext context, Widget? child) {
      //   return Theme(
      //     data: ThemeData.light().copyWith(
      //       primaryColor: Color.fromRGBO(0, 78, 131, 10),
      //       buttonTheme: ButtonThemeData(
      //         textTheme: ButtonTextTheme.primary,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(8.0),
      //         ),
      //       ),
      //     ),
      //     child: child!,
      //   );
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SwitchPages()),
            );
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color.fromRGBO(0, 78, 131, 10),
          ),
        ),
        title: Text(
          '${AppLocale.words[15].getString(context)}',
          style: TextStyle(
            color: Color.fromRGBO(0, 78, 131, 10),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: FutureBuilder(
                    future:
                        FirebaseFirestore.instance.collection('history').get(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasData) {
                        SummaryWaterDb.clear();
                        List<QueryDocumentSnapshot<Map<String, dynamic>>>
                            documents = snapshot.data!.docs;
                        for (var i = 0; i < snapshot.data!.size; i++) {
                          SummaryWaterDb.add(
                              documents[i].data()['available_capa']);
                        }
                        return Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${AppLocale.words[20].getString(context)}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(0, 78, 131, 10),
                                        fontFamily: "Poppins"),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: SizedBox(
                                height: 220,
                                child: GraphBar(
                                  SummaryWater: SummaryWaterDb,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                L_Button_2(
                                  onTap: PickDate,
                                  text:
                                      '${AppLocale.words[19].getString(context)}',
                                  icon: Icons.calendar_month_rounded,
                                ),
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(0, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      width: 2,
                                      color: Color.fromRGBO(0, 78, 131, 10),
                                    ),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      ExportData()
                                          .saveDataToJSON(FillDataList());
                                    },
                                    icon: Icon(
                                      Icons.download_rounded,
                                      color: Color.fromRGBO(0, 78, 131, 10),
                                      size: 34,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                      return Text('error');
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
