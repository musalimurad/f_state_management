import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/all_provider.dart';

class BasicProvider extends StatelessWidget {
  const BasicProvider({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('HomePage oxundu');
    return Scaffold(
      appBar: AppBar(
        title: Consumer(builder: ((context, ref, child) {
          String title = ref.watch(titleProvider);
          return Text(title);
        })),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            MyTextWidget(),
            MyCounterTextWidget(),
          ],
        ),
      ),
      floatingActionButton:
          const MyFloatActionButtonWidget(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyTextWidget extends ConsumerWidget {
  const MyTextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('MyText oxundu');
    return Text(ref.watch(textProvider));
  }
}

class MyCounterTextWidget extends ConsumerWidget {
  const MyCounterTextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('CounterText oxundu');
    return Text(
      ref.watch(counterProvider).toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MyFloatActionButtonWidget extends ConsumerWidget {
  const MyFloatActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('actionButton oxundu');
    return FloatingActionButton(
      onPressed: () {
        // ignore: deprecated_member_use
        ref.watch(counterProvider.state).state++;
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
