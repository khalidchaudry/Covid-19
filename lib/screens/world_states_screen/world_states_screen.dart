import 'package:covid_19/model/world_state_model.dart';
import 'package:covid_19/screens/routes/routes.dart';
import 'package:covid_19/services/utils/state_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({Key? key}) : super(key: key);

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();
  final color = <Color>[Colors.green, Colors.blue, Colors.red];
  @override
  dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StateServices services = StateServices();

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: services.getStatesData(),
                builder: ((context, AsyncSnapshot<WorldStateModel> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        PieChart(
                          chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true),
                          dataMap: {
                            'Total': snapshot.data!.cases!.toDouble(),
                            'Recovered': snapshot.data!.recovered!.toDouble(),
                            'Deaths': snapshot.data!.deaths!.toDouble(),
                          },
                          animationDuration: const Duration(seconds: 2),
                          chartType: ChartType.disc,
                          colorList: color,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                reUseableRow(
                                    title: 'Total',
                                    value: snapshot.data!.cases!.toDouble()),
                                const SizedBox(
                                  height: 20,
                                ),
                                reUseableRow(
                                    title: 'Recovered',
                                    value:
                                        snapshot.data!.recovered!.toDouble()),
                                const SizedBox(
                                  height: 20,
                                ),
                                reUseableRow(
                                    title: 'Deaths',
                                    value: snapshot.data!.deaths!.toDouble()),
                                const SizedBox(
                                  height: 20,
                                ),
                                reUseableRow(
                                    title: 'Active',
                                    value: snapshot.data!.active!.toDouble()),
                                const SizedBox(
                                  height: 20,
                                ),
                                reUseableRow(
                                    title: 'Criticals',
                                    value: snapshot.data!.critical!.toDouble()),
                                const SizedBox(
                                  height: 20,
                                ),
                                reUseableRow(
                                    title: 'Today Recovered',
                                    value: snapshot.data!.todayRecovered!
                                        .toDouble()),
                                const SizedBox(
                                  height: 20,
                                ),
                                reUseableRow(
                                    title: 'Today Deaths',
                                    value:
                                        snapshot.data!.todayDeaths!.toDouble()),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                primary: Colors.green,
                                minimumSize: const Size(double.infinity, 50)),
                            onPressed: () => Navigator.pushNamed(
                                context, Routes.cuntriesList),
                            child: const Text('Track Countries'))
                      ],
                    );
                  } else {
                    return Center(
                        child: SpinKitFadingCircle(
                      controller: _controller,
                      size: 50,
                      color: Colors.white,
                    ));
                  }
                })),
          ),
        ],
      ),
    )));
  }

  Widget reUseableRow({required String title, required double value}) {
    return Row(
      children: [
        Text(title),
        const Spacer(),
        Text(value.toString()),
      ],
    );
  }
}
