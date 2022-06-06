import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

import '../../loading/loading.dart';
import '../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage(
        child: HomePage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context
                    .flow<HomeStatus>()
                    .update((state) => HomeStatus.products);
              },
              child: const Text('Products'),
            ),
            ElevatedButton(
              onPressed: () {
                context.flow<HomeStatus>().update((state) => HomeStatus.orders);
              },
              child: const Text('Orders'),
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .flow<HomeStatus>()
                    .update((state) => HomeStatus.newOrder);
              },
              child: const Text('New Order'),
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .flow<LoadingStatus>()
                    .update((state) => LoadingStatus.synchronization);
              },
              child: const Text('Synchronization'),
            ),
          ],
        ),
      ),
    );
  }
}