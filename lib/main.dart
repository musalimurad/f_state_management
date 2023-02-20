import 'package:f_state/screens/notifier_provider_screen.dart';
import 'package:f_state/screens/provider_basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: NotifierProviderScreen()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const MyTextWidget(),
            MyCounterTextWidget(
              counter: _counter,
            ),
          ],
        ),
      ),
      floatingActionButton: MyFloatActionButtonWidget(
        onClick: () {
          setState(() {
            _counter++;
          });
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'You have pushed the button this many times:',
    );
  }
}

class MyCounterTextWidget extends StatelessWidget {
  int counter;
  MyCounterTextWidget({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MyFloatActionButtonWidget extends StatelessWidget {
  VoidCallback onClick;
  MyFloatActionButtonWidget({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onClick();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
