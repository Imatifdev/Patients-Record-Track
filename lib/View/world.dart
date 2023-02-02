// ignore_for_file: prefer_const_constructors, unused_local_variable, sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:patientstrack/View/Details.dart';

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
                    print(snapshot);
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
                                        height: 50,
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
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                    image: snapshot.data![index]
                                                        ['countryInfo']['flag'],
                                                    name: snapshot.data![index]
                                                        ['country'],
                                                    totalCases: snapshot
                                                        .data![index]['cases'],
                                                    totalRecovered:
                                                        snapshot.data![index]
                                                            ['recovered'],
                                                    totalDeaths: snapshot
                                                        .data![index]['deaths'],
                                                    active: snapshot
                                                        .data![index]['active'],
                                                    test: snapshot.data![index]
                                                        ['tests'],
                                                    todayRecovered:
                                                        snapshot.data![index]
                                                            ['todayRecovered'],
                                                    critical:
                                                        snapshot.data![index]
                                                            ['critical'],
                                                  )));
                                    },
                                    child: ListTile(
                                      title: Text(snapshot.data![index]
                                              ['country']
                                          .toString()),
                                      subtitle: Text(snapshot.data![index]
                                              ['cases']
                                          .toString()),
                                      leading: Image(
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.contain,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag']),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else if (name.toLowerCase().contains(
                                searchcontroller.text.toLowerCase())) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                    image: snapshot.data![index]
                                                        ['countryInfo']['flag'],
                                                    name: snapshot.data![index]
                                                        ['country'],
                                                    totalCases: snapshot
                                                        .data![index]['cases'],
                                                    totalRecovered:
                                                        snapshot.data![index]
                                                            ['recovered'],
                                                    totalDeaths: snapshot
                                                        .data![index]['deaths'],
                                                    active: snapshot
                                                        .data![index]['active'],
                                                    test: snapshot.data![index]
                                                        ['tests'],
                                                    todayRecovered:
                                                        snapshot.data![index]
                                                            ['todayRecovered'],
                                                    critical:
                                                        snapshot.data![index]
                                                            ['critical'],
                                                  )));
                                    },
                                    child: ListTile(
                                      leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag']),
                                      ),
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text("Effected: " +
                                          snapshot.data![index]['cases']
                                              .toString()),
                                    ),
                                  ),
                                  Divider()
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  }))
        ],
      ),
    );
  }
}
