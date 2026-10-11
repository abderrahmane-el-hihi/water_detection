import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:waterdetection/home2page.dart';
import 'package:waterdetection/serianumpage.dart';
import 'package:waterdetection/settingspage.dart';

class ProductMenuPage extends StatefulWidget {
  const ProductMenuPage({super.key});

  @override
  State<ProductMenuPage> createState() => _ProductMenuPageState();
}

class _ProductMenuPageState extends State<ProductMenuPage> {
  void Back() {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => const SerialPage())));
  }

  List<Map<String, dynamic>> Data = [];

  void ToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SwitchPages()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          AppLocale.words[12].getString(context),
          style: const TextStyle(
              color: Color.fromRGBO(0, 78, 131, 10), fontFamily: "Poppins"),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SerialPage()),
              );
            },
            icon: const Icon(
              Icons.add_rounded,
              color: Color.fromRGBO(0, 78, 131, 10),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: FirebaseFirestore.instance.collection('detector').get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      int quantite = snapshot.data.size as int;
                      return Expanded(
                        child: ListView.builder(
                            itemCount: quantite,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: const Color.fromRGBO(0, 78, 131, 10),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ListTile(
                                        onTap: ToHome,
                                        title: Text(
                                          'ceterne ${index + 1}',
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  0, 78, 131, 10),
                                              fontFamily: "Poppins"),
                                        ),
                                        leading: const Icon(
                                          Icons.abc,
                                          color: Color.fromRGBO(0, 78, 131, 10),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            }),
                      );
                    } else {
                      return const Center(
                        child: Text('no data'),
                      );
                    }
                  }
                }),
          ],
        ),
      ),
    );
  }
}
