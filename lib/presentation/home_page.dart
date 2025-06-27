import 'package:flutter/material.dart';
import 'package:riverpod_learn/presentation/custom_button.dart';
import 'package:riverpod_learn/providers/async_notifier_demo.dart';
import 'package:riverpod_learn/providers/future_provider_demo.dart';
import 'package:riverpod_learn/providers/notifier_provider_demo.dart';
import 'package:riverpod_learn/providers/provider_demo.dart';
import 'package:riverpod_learn/providers/stream_notifier_demo.dart';
import 'package:riverpod_learn/providers/stream_provider_demo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
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
            // Future Provider
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
            // Stream Provider       
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
