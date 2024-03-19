import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
    );
  }
}

/*  bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
        child: SizedBox(
          height: 70,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(children: [Icon(Icons.home_outlined), Text('Home')]),
                  Column(children: [Icon(Icons.cached_outlined), Text('Pending')]),
                  Column(children: [Icon(Icons.stacked_bar_chart_outlined), Text('Reports')]),
                  Column(children: [Icon(Icons.settings_outlined), Text('Settings')]),
                ],
              ),
            ),
          ),
        ),
      ), */