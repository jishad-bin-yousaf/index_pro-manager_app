import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../View/widgets/custom_widgets.dart';
import '../controllers/pending_controller.dart';
import 'transaction_details.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PendingController c = Get.put(PendingController());
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 85,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF006B57),
                  Color.fromARGB(255, 0, 178, 146),
                ],
              )),
              child: SearchBar(
                controller: c.searchController,
                hintText: 'Search Referral No.',
                onChanged: (value) => c.onSearch(value),
                trailing: [Icon(Icons.search, color: theme.colorScheme.primary)],
              ),
            ),
            GetBuilder(
              id: 'data',
              builder: (PendingController c) {
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
