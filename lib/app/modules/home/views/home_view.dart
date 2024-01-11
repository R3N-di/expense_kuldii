import 'package:expense_kuldii/app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

import './widgets/info_balance.dart';
import './widgets/card_expense.dart';

class HomeView extends GetView<HomeController> {
  // final List<SalesData> chartData = [
  //   SalesData(DateTime(2010), 35),
  //   SalesData(DateTime(2011), 28),
  //   SalesData(DateTime(2012), 34),
  //   SalesData(DateTime(2013), 32),
  //   SalesData(DateTime(2014), 40)
  // ];

  // const HomeView({Key? key}) : super(key: key);

  List<Map<String, dynamic>> myData = [
    {
      'image': 'assets/icons/shopping-bag.png',
      'title': 'Shopping',
      'warnaLogo': appPrimary,
      'warnaLatar': appVioletSoft,
      'amount': '\$500',
      'subtitle': 'Buy some grocery',
      'time': '11:00',
    },
    {
      'image': 'assets/icons/income.png',
      'title': 'Income Gak tau apa',
      'warnaLogo': appGreen,
      'warnaLatar': appGreenSoft,
      'amount': '\$500',
      'subtitle': 'Buy some grocery',
      'time': '11:00',
    },
    {
      'image': 'assets/icons/outcome.png',
      'title': 'Dimaling cuy',
      'warnaLogo': appRed,
      'warnaLatar': appRedSoft,
      'amount': '\$10',
      'subtitle': 'Diambil saat mandi',
      'time': '11:00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            // BACKGROUND
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [appYellowSoft, appVioletSoft])),
            ),
            // PAGE VIEW
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // foto profile
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color: appPrimary),
                            ),
                            Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(60),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://picsum.photos/536/354"))))
                          ],
                        ),
                        // Bulan
                        Row(
                          children: [
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 33,
                              color: appPrimary,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "October",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        // Lonceng
                        Icon(
                          Icons.notifications,
                          color: appPrimary,
                          size: 38,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // account balance & money
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Account Balance",
                        style: TextStyle(fontSize: 15, letterSpacing: 1.3),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\$9400",
                        style: TextStyle(
                            fontSize: 53, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  // income & outcome
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InfoBalance(
                        isIncome: true,
                        balance: 5000,
                      ),
                      InfoBalance(
                        isIncome: false,
                        balance: 2500,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  // Bisa Discroll
                  // Spend Frequency
                  Expanded(
                      child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Spend Frequency",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),

                      // CHART
                      Padding(
                        padding:
                            // EdgeInsets.symmetric(horizontal: 20),
                            EdgeInsets.only(right: 30),
                        child: Container(
                            height: 200,
                            // color: appPrimary,
                            // child: SfCartesianChart(
                            //     primaryXAxis: DateTimeAxis(),
                            //     series: <CartesianSeries>[
                            //       // Renders line chart
                            //       LineSeries<SalesData, DateTime>(
                            //           dataSource: chartData,
                            //           xValueMapper: (SalesData sales, _) =>
                            //               sales.year,
                            //           yValueMapper: (SalesData sales, _) =>
                            //               sales.sales)
                            //     ])
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(show: false),
                                titlesData: FlTitlesData(
                                    show: true,
                                    bottomTitles: SideTitles(
                                      interval: 1,
                                      showTitles: true,
                                      reservedSize: 22,
                                      margin: 20,
                                      getTextStyles: (context, value) =>
                                          TextStyle(color: appPrimary),
                                      getTitles: (value) {
                                        switch (value.toInt()) {
                                          case 0:
                                            return '2018';
                                          case 1:
                                            return '2019';
                                          case 2:
                                            return '2020';
                                          case 3:
                                            return '2021';
                                          case 4:
                                            return '2022';
                                          case 5:
                                            return '2023';
                                          case 6:
                                            return '2024';
                                          default:
                                            return '';
                                        }
                                      },
                                    ),
                                    leftTitles: SideTitles(
                                      showTitles: true,
                                      margin: 20,
                                      getTextStyles: (context, value) =>
                                          TextStyle(color: appBlue),
                                    ),
                                    rightTitles: SideTitles(showTitles: false),
                                    topTitles: SideTitles(showTitles: false)),
                                borderData: FlBorderData(show: false),
                                minX: 0,
                                maxX: 6,
                                minY: 0,
                                maxY: 40,
                                // aksi saat ditekan
                                lineTouchData: LineTouchData(
                                  touchTooltipData: LineTouchTooltipData(
                                    tooltipBgColor: Colors.blueAccent,
                                    getTooltipItems:
                                        (List<LineBarSpot> touchedBarSpots) {
                                      // Logika untuk menampilkan informasi tooltip
                                      return touchedBarSpots.map((barSpot) {
                                        final flSpot = barSpot;
                                        return LineTooltipItem(
                                          '${flSpot.y.toInt()} Kali',
                                          TextStyle(color: Colors.white),
                                        );
                                      }).toList();
                                    },
                                  ),
                                  handleBuiltInTouches: true,
                                ),

                                // garis ditengah / maksimal
                                extraLinesData: ExtraLinesData(
                                    horizontalLines: [
                                      HorizontalLine(
                                          y: 20, color: appRed, strokeWidth: 1)
                                    ]),

                                lineBarsData: [
                                  LineChartBarData(
                                    spots: [
                                      FlSpot(0, 20),
                                      FlSpot(1, 10),
                                      FlSpot(2, 30),
                                      FlSpot(3, 20),
                                      FlSpot(4, 40),
                                      FlSpot(5, 40),
                                      FlSpot(6, 20),
                                    ],
                                    isCurved: true,
                                    colors: [appPrimary],
                                    barWidth: 4,
                                    dotData: FlDotData(show: false),
                                    belowBarData: BarAreaData(show: false),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                                color: appYellowSoft,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "Today",
                              style: TextStyle(color: appYellow),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                                // color: appYellowSoft,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "Week",
                              style: TextStyle(color: appTextSoft),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                                // color: appYellowSoft,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "Month",
                              style: TextStyle(color: appTextSoft),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                                // color: appYellowSoft,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "Year",
                              style: TextStyle(color: appTextSoft),
                            ),
                          ),
                        ],
                      ),
                      // Section
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Recent Transaction"),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                  color: appVioletSoft,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Today",
                                style: TextStyle(color: appPrimary),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // Card
                      ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                height: 20,
                              ),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: myData.length,
                          itemBuilder: (context, index) {
                            return CardExpense(
                              data: myData[index],
                            );
                          }),
                          SizedBox(height: 30,),
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.white,
          color: appPrimary,
          activeColor: appPrimary,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Transaction'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Budget'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          onTap: (int i) => print('click index=$i'),
        ));
  }
}

// class SalesData {
//   SalesData(this.year, this.sales);
//   final DateTime year;
//   final double sales;
// }

