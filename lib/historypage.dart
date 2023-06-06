import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
// import 'package:waterdetection/HomePage.dart';
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
  List SummaryWaterDb = [];
  void fetchData() async {
    List<Map<String, dynamic>> dataList =
        await Export_data().fetchDataFromFirestore();
    print(dataList);
  }
  //List<Map<String, dynamic>> data = await Export_data().fetchDataFromFirestore();

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
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //color: Colors.black,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text('Notifications'),
                          Divider(
                            color: Color.fromARGB(255, 222, 228, 226),
                            thickness: 1,
                          ),
                        ],
                      ),
                    );
                  });
            },
            icon: Icon(
              Icons.notifications_rounded,
              color: Color.fromRGBO(0, 78, 131, 10),
            ),
          ),
          IconButton(
            onPressed: () {
              Export_data().exportDataToExcel(fetchData);
            },
            icon: Icon(
              Icons.download_rounded,
              color: Color.fromRGBO(0, 78, 131, 10),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
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
                        print(SummaryWaterDb);

                        return Column(
                          children: [
                            Center(
                              child: SizedBox(
                                height: 200,
                                child: GraphBar(
                                  SummaryWater: SummaryWaterDb,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
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
