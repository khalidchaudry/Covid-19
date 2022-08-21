import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String name, image;
  final int totalCases,
      totalDeaths,
      totalRecovered,
      critical,
      active,
      todayRecovered,
      test;
  const DetailsScreen(
      {Key? key,
      required this.name,
      required this.image,
      required this.totalCases,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.critical,
      required this.active,
      required this.todayRecovered,
      required this.test})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(widget.image),
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
                            value: widget.totalCases.toDouble()),
                        const SizedBox(
                          height: 20,
                        ),
                        reUseableRow(
                            title: 'Recovered',
                            value: widget.totalRecovered.toDouble()),
                        const SizedBox(
                          height: 20,
                        ),
                        reUseableRow(
                            title: 'Deaths',
                            value: widget.totalDeaths.toDouble()),
                        const SizedBox(
                          height: 20,
                        ),
                        reUseableRow(
                            title: 'Active', value: widget.active.toDouble()),
                        const SizedBox(
                          height: 20,
                        ),
                        reUseableRow(
                            title: 'Criticals',
                            value: widget.critical.toDouble()),
                        const SizedBox(
                          height: 20,
                        ),
                        reUseableRow(
                            title: 'Today Recovered',
                            value: widget.todayRecovered.toDouble()),
                        const SizedBox(
                          height: 20,
                        ),
                        reUseableRow(
                            title: 'Tests', value: widget.test.toDouble()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
