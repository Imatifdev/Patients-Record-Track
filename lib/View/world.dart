// ignore_for_file: prefer_const_constructors, unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';

import '../Services/network.dart';
import 'package:shimmer/shimmer.dart';

class WorldRecords extends StatefulWidget {
  @override
  State<WorldRecords> createState() => _WorldRecordsState();
}

class _WorldRecordsState extends State<WorldRecords> {
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CountriesStatsDataServices countriesstats = CountriesStatsDataServices();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchcontroller,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1, color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1)),
                  hintText: "Seacrh Country"),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: countriesstats.getcountriesdata(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return Shimmer.fromColors(
                          child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      title: Container(
                                        height: 10,
                                        width: 70,
                                        color: Colors.black,
                                      ),
                                      leading: Container(
                                        height: 20,
                                        width: 70,
                                        color: Colors.black,
                                      ),
                                      subtitle: Container(
                                        height: 20,
                                        width: 70,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                          baseColor: Colors.grey,
                          highlightColor: Colors.black);
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data![index]['country'];
                            if (searchcontroller.text.isEmpty) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(snapshot.data![index]['country']
                                        .toString()),
                                    leading: Image(
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.contain,
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag']),
                                    ),
                                  ),
                                ],
                              );
                            } else if (name.toLowerCase().contains(
                                searchcontroller.text.toLowerCase())) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(snapshot.data![index]['country']
                                        .toString()),
                                    leading: Image(
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.contain,
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag']),
                                    ),
                                  ),
                                ],
                              );
                            } else {}
                            return Text("data");
                          });
                    }
                  }))
        ],
      ),
    );
  }
}
