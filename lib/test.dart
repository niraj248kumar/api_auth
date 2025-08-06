import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Example1 extends StatefulWidget {
  const Example1({super.key});

  @override
  State<Example1> createState() {
    print('create state');
    return _Example1State();
  }
}

class _Example1State extends State<Example1> {
  int _counter = 0;

  _Example1State() {
    Get.snackbar("constructor", "mounted: $mounted");
  }

  @override
  void initState() {
    super.initState();
    // print('initState, mounted: $mounted');
    Get.snackbar("initState", "mounted: $mounted");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // print('didChangeDependencies, mounted: $mounted');
    Get.snackbar("didChangeDependencies", "mounted: $mounted");
  }

  @override
  void setState(VoidCallback fn) {
    print('setState');
    super.setState(fn);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build method');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),

            // counter text
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            // navigation button
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Next Page'),
              ),
            ),
          ],
        ),
      ),

      // increment floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant Example1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    // print('didUpdateWidget, mounted: $mounted');
    Get.snackbar("didUpdateWidget", "mounted: $mounted");
  }

  @override
  void deactivate() {
    super.deactivate();
    // print('deactivate, mounted: $mounted');
    Get.snackbar("deactivate", "mounted: $mounted");
  }

  @override
  void dispose() {
    super.dispose();
    // print('dispose, mounted: $mounted');
    Get.snackbar("dispose", "mounted: $mounted");
  }

  @override
  void reassemble() {
    super.reassemble();
    Get.snackbar("reassemble", "mounted: $mounted");
    // print('reassemble, mounted: $mounted');
  }
}
