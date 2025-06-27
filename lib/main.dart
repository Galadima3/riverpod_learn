import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn/providers/async_notifier_demo.dart';
import 'package:riverpod_learn/providers/future_provider_demo.dart';
import 'package:riverpod_learn/providers/notifier_provider_demo.dart';
import 'package:riverpod_learn/providers/provider_demo.dart';
import 'package:riverpod_learn/providers/stream_notifier_demo.dart';
import 'package:riverpod_learn/providers/stream_provider_demo.dart';
import 'package:riverpod_learn/widgets/custom_button.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Riverpod 💙"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Provider
            CustomButton(
              title: "Provider",
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProviderDemo(),
                    ),
                  ),
            ),
            // Notifier Provider => Replacement for StateNotifier
            CustomButton(
              title: "Notifier Provider",
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CounterWidget(),
                    ),
                  ),
            ),
            // Async Notifier Provider
            CustomButton(
              title: "Async Notifier Provider",
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserWidget()),
                  ),
            ),
            // Stream Notifier Provider
            CustomButton(
              title: "Stream Notifier Provider",
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StreamNotifierDemo(),
                    ),
                  ),
            ),
            CustomButton(
              title: "Future Provider",
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FutureProviderDemo(),
                    ),
                  ),
            ),
            CustomButton(
              title: "Stream Provider",
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StreamCounterWidget(),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
