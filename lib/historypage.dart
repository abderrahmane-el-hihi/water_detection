import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:waterdetection/home2page.dart';
import 'package:waterdetection/settingspage.dart';
import 'components/graph_bar/graphbar.dart';
import 'services/export_data.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List SummaryWaterDb2 = [];

  List mesures = [];
  List<DateTime> date = [];
  late DateTime dateTime;

  @override
  void initState() {
    super.initState();
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
        actions: [
          IconButton(
            onPressed: () {
              ExportData().exportCollectionToExcel('history');
            },
            icon: Icon(
              Icons.download_rounded,
              color: Color.fromRGBO(0, 78, 131, 10),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('history')
                          .get(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasData) {
                          SummaryWaterDb2.clear();
                          List<QueryDocumentSnapshot<Map<String, dynamic>>>
                              documents = snapshot.data!.docs;
                          for (var i = 0; i < snapshot.data!.size; i++) {
                            SummaryWaterDb2.add(
                                documents[i].data()['available_capa']);
                          }
                        }
                        return Center(
                          child: Column(
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
                              SizedBox(
                                height: 220,
                                child: GraphBar(
                                  SummaryWater: SummaryWaterDb2,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${AppLocale.words[23].getString(context)}',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(0, 78, 131, 10),
                              fontFamily: "Poppins"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('history')
                          .get(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasData) {
                          mesures.clear();
                          for (var i = 0; i < snapshot.data.size; i++) {
                            mesures.add(
                                snapshot.data.docs[i].data()['available_capa']);
                            dateTime =
                                snapshot.data.docs[i].data()['date'].toDate();
                            date.add(dateTime);
                          }

                          return Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: ListView.builder(
                                itemCount: mesures.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                            color:
                                                Color.fromRGBO(0, 78, 131, 10),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: ListTile(
                                          title: Row(
                                            children: [
                                              Text(
                                                '${DateFormat('dd-MM-yyyy').format(date[index])}: ${mesures[index]}%',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 78, 131, 10),
                                                    fontFamily: "Poppins"),
                                              ),
                                              SizedBox(
                                                width: 80,
                                              ),
                                              CircularPercentIndicator(
                                                radius: 15,
                                                lineWidth: 4,
                                                percent: mesures[index] / 100,
                                                progressColor:
                                                    mesures[index] < 20
                                                        ? Color.fromARGB(
                                                            144, 255, 57, 57)
                                                        : Color.fromRGBO(
                                                            0, 78, 131, 10),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  );
                                }),
                          );
                        } else {
                          return Center(
                            child: Text('no data'),
                          );
                        }
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
