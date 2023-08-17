import 'package:eden/core/utils/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/buttons/custom_icon_button.dart';

class WeeklyEarningChart extends StatefulWidget {
  const WeeklyEarningChart({super.key});

  @override
  State<WeeklyEarningChart> createState() => _WeeklyEarningChartState();
}

class _WeeklyEarningChartState extends State<WeeklyEarningChart> {
  final Color leftBarColor = AppColors.kPrimary;
  final Color rightBarColor = AppColors.kAccent1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sales Earnings', style: AppTypography.kLight16),
        Row(
          children: [
            Text(r'$1,242.45', style: AppTypography.kLight30),
            SizedBox(width: AppSpacing.tenHorizontal),
            CustomIconButton(
              size: 30.h,
              color: AppColors.kPrimary.withOpacity(0.15),
              icon: AppAssets.kTriangleUp,
              onTap: () {},
            ),
            SizedBox(width: 9.w),
            Text(
              '+25%',
              style: AppTypography.kBold14.copyWith(color: AppColors.kPrimary),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 205.h,
          width: double.maxFinite,
          child: const WeeklyLineChart(
            data: [50, 70, 60, 40, 30, 80, 90],
          ),
        ),
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: AppSpacing.tenVertical,
              height: 10.w,
              decoration: const BoxDecoration(
                color: AppColors.kPrimary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            const Text('Sales this week'),
            const SizedBox(width: 16),
            Container(
              width: 10.01.w,
              height: 10.01.h,
              decoration: const BoxDecoration(
                color: AppColors.kAccent1,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            const Text('Sales last week'),
          ],
        ),
      ],
    );
  }
}

class WeeklyLineChart extends StatelessWidget {
  final List<double> data;

  const WeeklyLineChart({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 100,
        gridData: const FlGridData(
          show: true,
          drawVerticalLine: true,
          drawHorizontalLine: false,
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final style = AppTypography.kBold14;
                Widget text;
                switch (value.toInt()) {
                  case 1:
                    text = Text('M', style: style);
                    break;
                  case 2:
                    text = Text('T', style: style);
                    break;
                  case 3:
                    text = Text('W', style: style);
                    break;
                  case 4:
                    text = Text('T', style: style);
                    break;
                  case 5:
                    text = Text('F', style: style);
                    break;
                  case 6:
                    text = Text('S', style: style);
                    break;
                  case 7:
                    text = Text('S', style: style);
                    break;
                  default:
                    text = Text('S', style: style);
                    break;
                }
                return text;
              },
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            left: BorderSide(color: Colors.grey),
            right: BorderSide(color: Colors.grey),
          ),
        ),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: AppColors.kWhite,
            tooltipPadding: EdgeInsets.zero,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((touchedSpot) {
                return LineTooltipItem(
                  r'$250',
                  AppTypography.kBold14.copyWith(color: AppColors.kPrimary),
                );
              }).toList();
            },
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 50),
              FlSpot(1, 60),
              FlSpot(2, 40),
              FlSpot(3, 50),
              FlSpot(4, 30),
              FlSpot(5, 70),
              FlSpot(6, 40),
            ],
            isCurved: false,
            barWidth: 0,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: AppColors.kAccent1,
            ),
          ),
          LineChartBarData(
            spots: [
              FlSpot(0, data[0]),
              FlSpot(1, data[1]),
              FlSpot(2, data[2]),
              FlSpot(3, data[3]),
              FlSpot(4, data[4]),
              FlSpot(5, data[5]),
              FlSpot(6, data[6]),
            ],
            isCurved: false,
            barWidth: 4,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                final radius = 2.r;
                const dotColor = AppColors.kPrimary;
                final strokeWidth = 5.r;
                const strokeColor = Colors.white;
                return FlDotCirclePainter(
                  radius: radius,
                  color: dotColor,
                  strokeWidth: strokeWidth,
                  strokeColor: strokeColor,
                );
              },
            ),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
