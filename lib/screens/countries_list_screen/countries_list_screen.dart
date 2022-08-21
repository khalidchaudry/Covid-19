import 'package:covid_19/screens/details_screen/details_screen.dart';
import 'package:covid_19/services/utils/countries_list_services.dart';
import 'package:flutter/material.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CountriesListServices services = CountriesListServices();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          onChanged: (value) {
            setState(() {});
          },
          decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.black,
              hintText: 'Search here',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search)),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: services.getCountriesData(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var countryName =
                              snapshot.data![index]['country'].toString();
                          if (searchController.text.isEmpty) {
                            return ListTile(
                              
                              title: Text(
                                  snapshot.data![index]['country'].toString()),
                              subtitle: Text(
                                  'Effected: ${snapshot.data![index]['cases']}'),
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage(snapshot
                                      .data![index]['countryInfo']['flag'])),
                            );
                          } else if (countryName
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return ListTile(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DetailsScreen(
                                          name: countryName,
                                          image: snapshot.data![index]
                                              ['countryInfo']['flag'],
                                          totalCases: snapshot.data![index]
                                              ['cases'],
                                          totalDeaths: snapshot.data![index]
                                              ['deaths'],
                                          totalRecovered: snapshot.data![index]
                                              ['recovered'],
                                          critical: snapshot.data![index]
                                              ['critical'],
                                          active: snapshot.data![index]
                                              ['active'],
                                          todayRecovered: snapshot.data![index]
                                              ['todayRecovered'],
                                          test: snapshot.data![index]
                                              ['tests']))),
                              title: Text(
                                  snapshot.data![index]['country'].toString()),
                              subtitle: Text(
                                  'Effected: ${snapshot.data![index]['cases']}'),
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage(snapshot
                                      .data![index]['countryInfo']['flag'])),
                            );
                          } else {
                            return const SizedBox();
                          }
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          )
        ],
      )),
    );
  }
}
