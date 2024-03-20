import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Models/home.dart';
import '../View/widgets/custom_widgets.dart';
import '../controllers/transaction_details_controller.dart';

class TransactionDetailsView extends StatelessWidget {
  const TransactionDetailsView({super.key, required this.data});
  final TransactionModel data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    TransactionDetailsController c = Get.put(TransactionDetailsController(data: data));
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('History'),
          actions: [
            InkWell(
              onTap: () {},
              child: Card(
                //  elevation: 2,
                color: theme.colorScheme.secondaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.share_outlined,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: ListView(padding: const EdgeInsets.all(15), children: [
          detailsCard(theme),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Select Status',
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.outline),
            ),
          ),
          Obx(
            () => Visibility(
              visible: c.showStatusSelection.isTrue,
              replacement: selectedStatus(theme, c),
              child: selectStatus(c),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Comments',
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.outline),
            ),
          ),
          TextField(
            controller: c.commentController,
            maxLines: 3,
            decoration: InputDecoration(
              filled: true,
              fillColor: theme.colorScheme.secondaryContainer,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              labelText: "Enter",
              alignLabelWithHint: true,
            ),
          ),
          Obx(() => AbsorbPointer(
                absorbing: c.isButtonEnabled.isFalse,
                child: FilledButton(
                  onPressed: () => Get.back(),
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    backgroundColor: c.isButtonEnabled.isTrue
                        ? theme.colorScheme.primary // Button enabled color
                        : theme.colorScheme.secondaryContainer,
                  ),
                  child: const Text('Save'),
                ),
              ))
        ]));
  }

  Card detailsCard(ThemeData theme) {
    return Card(
        child: Column(children: [
      Container(
        width: double.maxFinite,
        //    height: ,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primary,
              const Color.fromARGB(255, 1, 147, 121),
            ],
          ),
        ),
        child: Column(
          children: [
            Text(
              'Username',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.background,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Referral No.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.background,
              ),
            )
          ],
        ),
      ),
      const SizedBox(height: 10),
      detailsRow(theme, title: 'Date', value: DateFormat('dd-MMM-yy, h:mm a').format(data.createdDate!)),
      const Divider(),
      detailsRow(theme, title: 'A/c Number', value: data.accNo ?? ''),
      const Divider(),
      detailsRow(theme, title: 'A/c Holder Name', value: data.accName ?? ''),
      const Divider(),
      detailsRow(theme, title: 'IFSC Code', value: data.ifsc ?? ''),
      const Divider(),
      detailsRow(theme, title: 'Bank', value: data.bank ?? ''),
      const Divider(),
      detailsRow(theme, title: 'USTD', value: '${data.tUsdt ?? ''} USTD', textColor: theme.colorScheme.primary),
      const Divider(),
      detailsRow(theme, title: 'Transfer Rate', value: data.tRate ?? ''),
      const Divider(),
      detailsRow(theme, title: 'Total', value: '${data.tAmount ?? ''} (INR)', textColor: theme.colorScheme.primary),
      const SizedBox(height: 10)
    ]));
  }

  detailsRow(ThemeData theme, {required String title, required String value, Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title :',
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.outline),
          ),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  selectedStatus(ThemeData theme, TransactionDetailsController c) {
    return InkWell(
      onTap: () => c.showStatusSelection.value = true,
      child: Card(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                statusRow(c.currentStatus),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: theme.colorScheme.outline,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  selectStatus(TransactionDetailsController c) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(onTap: () => c.onStatusSelected('Finish'), child: statusRow("Finish")),
            const Divider(),
            InkWell(onTap: () => c.onStatusSelected('Success'), child: statusRow("Success")),
            const Divider(),
            InkWell(onTap: () => c.onStatusSelected('Pending'), child: statusRow("Pending")),
            const Divider(),
            InkWell(onTap: () => c.onStatusSelected('Cancelled'), child: statusRow("Cancelled")),
            const Divider(),
            InkWell(onTap: () => c.onStatusSelected('Failed'), child: statusRow("Failed")),
          ],
        ),
      ),
    );
  }

  statusRow(String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 15,
            color: CustomWidgets.getStatusColor(status),
          ),
          Text(
            '\t\t$status',
            style: Theme.of(Get.context!).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
