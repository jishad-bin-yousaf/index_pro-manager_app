import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import '../View/widgets/custom_widgets.dart';
import '../controllers/report_controller.dart';
import 'transaction_details.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ReportController c = Get.put(ReportController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 300),
              painter: RPSCustomPainter(),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: c.fromDateController,
                          readOnly: true,
                          onTap: () async {
                            c.fromDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now().subtract(const Duration(days: 2 * 365)),
                                  lastDate: DateTime.now(),
                                  currentDate: c.fromDate,
                                  initialDate: c.fromDate,
                                ) ??
                                DateTime.now();
                            c.fromDateController.text = DateFormat('dd-MMM-yy').format(c.fromDate);
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: theme.colorScheme.background,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: const Icon(Icons.date_range_outlined),
                              suffixIconColor: theme.colorScheme.primary,
                              contentPadding: const EdgeInsets.all(10),
                              hintText: 'From Date'),
                        ),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: c.toDateController,
                          readOnly: true,
                          onTap: () async {
                            c.toDate = await showDatePicker(
                                  context: context,
                                  firstDate: c.fromDate,
                                  lastDate: DateTime.now(),
                                  currentDate: DateTime.now(),
                                  initialDate: c.toDate,
                                ) ??
                                DateTime.now();

                            c.toDateController.text = DateFormat('dd-MMM-yy').format(c.toDate);
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: theme.colorScheme.background,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: const Icon(Icons.date_range_outlined),
                              suffixIconColor: theme.colorScheme.primary,
                              contentPadding: const EdgeInsets.all(10),
                              hintText: 'From Date'),
                        ),
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetBuilder(
                        id: 'data',
                        builder: (ReportController c) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              '${c.filteredDataList.length} Reports',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.colorScheme.background,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0, top: 25),
                        child: FilledButton(
                          onPressed: () => c.onSearch(),
                          style: FilledButton.styleFrom(
                              fixedSize: Size(150, 50),
                              textStyle: theme.textTheme.titleMedium,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
                          child: const Text('Search'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GetBuilder(
              id: 'data',
              builder: (ReportController c) {
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: c.filteredDataList.length,
                    itemBuilder: (context, index) {
                      final data = c.filteredDataList[index];
                      return InkWell(
                        onTap: () {
                          Get.to(() => TransactionDetailsView(data: data));
                        },
                        child: Card(
                          elevation: 0,
                          color: theme.colorScheme.secondaryContainer,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Refer No : ${data.trNo}',
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: CustomWidgets.getStatusColor(data.status ?? '')),
                                      child: Text(
                                        data.status ?? '',
                                        style: theme.textTheme.titleSmall?.copyWith(color: theme.colorScheme.background),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Trade :',
                                      style: theme.textTheme.titleSmall?.copyWith(color: theme.colorScheme.outline),
                                    ),
                                    Text(
                                      '${data.tUsdt ?? ''} USTD=${data.tAmount ?? ''} INR',
                                      style: theme.textTheme.bodyLarge?.copyWith(
                                        color: theme.colorScheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Date :',
                                      style: theme.textTheme.titleSmall?.copyWith(color: theme.colorScheme.outline),
                                    ),
                                    Text(
                                      "${DateFormat('dd-MMM-yy, h:mm a').format(data.createdDate!)}",
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.5833333);
    path_0.lineTo(size.width * 0.5250000, size.height * 0.5833333);
    path_0.cubicTo(size.width * 0.5127278, size.height * 0.5833333, size.width * 0.5027778, size.height * 0.6104674, size.width * 0.5027778, size.height * 0.6439394);
    path_0.lineTo(size.width * 0.5027778, size.height * 0.9393939);
    path_0.cubicTo(size.width * 0.5027778, size.height * 0.9728636, size.width * 0.4928278, size.height, size.width * 0.4805556, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
      Offset(size.width / 2, 0), // Start point of the gradient (top center)
      Offset(size.width / 2, size.height), // End point of the gradient (bottom center)
      [Color(0xff00836B), Color.fromARGB(140, 0, 131, 107)], // List of gradient colors
      [0, 1], // Stops for each color
    );
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
