import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:index_pro/view/widgets/custom_widgets.dart';
import 'package:intl/intl.dart';

import '../controllers/Home_controller.dart';
import 'transaction_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    HomeController c = Get.put(HomeController());
    return Scaffold(
        body: Stack(children: [
      Column(children: [
        header(c, theme),
        Expanded(child: body(c, theme)),
      ]),
      Positioned(
          top: 200,
          left: 0,
          right: 0,
          child: GetBuilder(
            id: 'data',
            builder: (HomeController c) {
              return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                cards(theme, 'Pending', '${c.pendingCount}'),
                cards(theme, 'Success', '${c.successCount}'),
                cards(theme, 'Cancelled', '${c.cancelledCount}', dividerColor: theme.colorScheme.error),
              ]);
            },
          ))
    ]));
  }

  body(HomeController c, ThemeData theme) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70, left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recent Transition",
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                    CustomWidgets.customDivider(theme),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Text('More'),
                label: const Icon(Icons.arrow_forward_ios, size: 15),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(8),
                    backgroundColor: theme.colorScheme.secondaryContainer,
                    elevation: 0,
                    alignment: Alignment.topCenter,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              )
            ],
          ),
        ),
        GetBuilder(
          id: 'data',
          builder: (HomeController c) {
            return Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: c.data.length,
                itemBuilder: (context, index) {
                  final data = c.data[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => TransactionDetailsView(data: data));
                    },
                    child: Card(
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
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: (data.status ?? '') == 'Success'
                                        ? const Color.fromRGBO(0, 124, 12, 1)
                                        : (data.status ?? '') == 'Pending'
                                            ? const Color.fromRGBO(0, 131, 107, 1)
                                            : (data.status ?? '') == 'Finish'
                                                ? const Color.fromRGBO(228, 171, 0, 1)
                                                : (data.status ?? '') == 'Failed'
                                                    ? const Color.fromRGBO(164, 0, 0, 1)
                                                    : Colors.blueAccent,
                                  ),
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
                                  DateFormat('dd-MMM-yy, h:mm a').format(data.createdDate!),
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
    );
  }

  Card cards(ThemeData theme, String title, String count, {Color? dividerColor}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(color: theme.colorScheme.outline),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                count,
                style: theme.textTheme.titleLarge,
              ),
            ),
            CustomWidgets.customDivider(theme, color: dividerColor),
          ],
        ),
      ),
    );
  }

  Container header(HomeController c, ThemeData theme) {
    return Container(
        width: double.maxFinite,
        height: 250,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color.fromARGB(255, 0, 139, 113),
              Color(0xFF006B57),
              Color.fromARGB(255, 0, 139, 113),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hey, ${c.name}",
                    style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.background),
                  ),
                  Text(
                    'Welcome to our App',
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.outlineVariant),
                  )
                ],
              ),
            ),
            Container(
              //  padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                border: Border.all(color: theme.colorScheme.background, width: 0.125),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(color: theme.colorScheme.background, width: 0.25),
                ),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: theme.colorScheme.background,
                  foregroundImage: AssetImage(c.profileUrl),
                ),
              ),
            ),
          ],
        ));
  }
}
