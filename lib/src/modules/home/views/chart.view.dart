import 'package:guide_selective_process/src/core/styles/appcolors.style.dart';
import 'package:guide_selective_process/src/core/styles/appstyles.style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_selective_process/src/modules/home/controllers/home.controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class ChartView extends StatefulWidget {
  const ChartView({super.key});

  @override
  State<ChartView> createState() => _ChartViewState();
}

List<Color> gradientColors = [
  AppColors.PRIMARY,
  AppColors.SECUNDARY,
];

class _ChartViewState extends State<ChartView> {
  final HomeController _controller = Get.find<HomeController>();

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text("${_controller.chart.meta!.symbol!}: Gráfico", style: AppStyles.caption1),
          centerTitle: true,
        ),
        key: _controller.chartScaffoldKey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(media.width * 0.05, media.width * 0.05, media.width * 0.05, 0),
                    child: Text(
                      "Últimos 30 pregões",
                      style: AppStyles.head1.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
                    )),
                Padding(
                    padding: EdgeInsets.all(media.width * 0.05),
                    child: Stack(
                      children: <Widget>[
                        AspectRatio(
                            aspectRatio: 1.20,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  color: Colors.grey.withOpacity(0.15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 18,
                                    left: 12,
                                    top: 24,
                                    bottom: 12,
                                  ),
                                  child: LineChart(
                                    mainData(),
                                  ),
                                )))
                      ],
                    )),
              ])
            ])));
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('1º', style: AppStyles.subtitle1.copyWith(fontSize: MediaQuery.of(context).size.width * 0.04));
        break;
      case 9:
        text = Text("10º", style: AppStyles.subtitle1.copyWith(fontSize: MediaQuery.of(context).size.width * 0.04));
        break;
      case 19:
        text = Text('20º', style: AppStyles.subtitle1.copyWith(fontSize: MediaQuery.of(context).size.width * 0.04));
        break;
      case 29:
        text = Text('30º', style: AppStyles.subtitle1.copyWith(fontSize: MediaQuery.of(context).size.width * 0.04));
        break;
      default:
        text = Text('', style: AppStyles.subtitle1.copyWith(fontSize: MediaQuery.of(context).size.width * 0.04));
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String finalText = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(value);
    return Text(finalText, style: AppStyles.subtitle1.copyWith(fontSize: MediaQuery.of(context).size.width * 0.04), textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: true, touchTooltipData: LineTouchTooltipData(tooltipBgColor: AppColors.SECUNDARY)),
      gridData: FlGridData(
        show: true,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey.withOpacity(0.15),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.grey.withOpacity(0.15),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: MediaQuery.of(context).size.width * 0.1,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: (_controller.chart.indicators!.quote![0].open!.reduce((curr, next) => (curr ?? 0) > (next ?? 0) ? curr : next) ?? 0) -
                (_controller.chart.indicators!.quote![0].open!.reduce((curr, next) => (curr ?? 0) < (next ?? 0) ? curr : next) ?? 0) +
                1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: MediaQuery.of(context).size.width * 0.15,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.grey.withOpacity(0.15)),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: _controller.chart.indicators!.quote![0].open!.asMap().entries.map((e) {
            return FlSpot(e.key.toDouble(), e.value != null ? double.parse(e.value!.toStringAsFixed(2)) : 0.0);
          }).toList(),
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
