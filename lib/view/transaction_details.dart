import 'package:flutter/material.dart';

import '../Models/home.dart';

class TransactionDetailsView extends StatelessWidget {
  const TransactionDetailsView({super.key, required this.data});
  final TransactionModel data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
          Card(
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
            detailsRow()
          ]))
        ]));
  }

  detailsRow() {}
}
