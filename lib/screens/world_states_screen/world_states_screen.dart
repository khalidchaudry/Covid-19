import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({Key? key}) : super(key: key);

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this)
    ..repeat();
  final color = <Color>[Colors.green, Colors.blue, Colors.red];
  @override
  dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          PieChart(
            dataMap: const {
              'Total': 100,
              'Recovered': 80,
              'Deaths': 20,
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
                  reUseableRow(title: 'Total', value: 100),
                  const SizedBox(
                    height: 20,
                  ),
                  reUseableRow(title: 'Recovered', value: 80),
                  const SizedBox(
                    height: 20,
                  ),
                  reUseableRow(title: 'Deaths', value: 20),
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
              onPressed: () {},
              child: const Text('Track Countries')),
        ],
      ),
    )));
  }

  Widget reUseableRow({required String title, required int value}) {
    return Row(
      children: [
        Text(title),
        const Spacer(),
        Text(value.toString()),
      ],
    );
  }
}
