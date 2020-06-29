import 'package:flutter/material.dart';
import 'package:friends_party_crema/providers/invites.dart';
import 'package:provider/provider.dart';
import 'package:pie_chart/pie_chart.dart';

class Reports extends StatelessWidget {
  Map getDataMap(Invites invites) {
    Map<String, double> dataMap = Map();
    dataMap.putIfAbsent("Invited", () => (invites.invited.length).toDouble());
    dataMap.putIfAbsent("Not Invited",
        () => (invites.totalFriends - invites.invited.length).toDouble());

    return dataMap;
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colorList = [
      Colors.green,
      Colors.red,
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Reports",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Consumer<Invites>(
        builder: (context, invites, child) => Container(
          child: Center(
              child: PieChart(
            dataMap: getDataMap(invites),
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 32.0,
            chartRadius: MediaQuery.of(context).size.width / 2.5,
            showChartValuesInPercentage: false,
            showChartValues: false,
            showChartValuesOutside: false,
            chartValueBackgroundColor: Colors.grey[200],
            colorList: colorList,
            showLegends: true,
            legendPosition: LegendPosition.right,
            decimalPlaces: 0,
            showChartValueLabel: false,
            initialAngle: 0,
            chartValueStyle: defaultChartValueStyle.copyWith(
              color: Colors.blueGrey[900].withOpacity(0.9),
            ),
            chartType: ChartType.ring,
          )),
        ),
      ),
    );
  }
}
