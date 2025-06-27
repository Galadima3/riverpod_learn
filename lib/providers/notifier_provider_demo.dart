import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn/models/counter.dart';

class CounterNotifier extends Notifier<Counter> {
  @override
  Counter build() {
    return Counter(value: 0);
  }

  void increment() {
    state = Counter(value: state.value + 1);
  }

  void decrement() {
    state = Counter(value: state.value - 1);
  }

  void reset() {
    state = Counter(value: 0);
  }
}

// Notifier Provider
final counterProvider = NotifierProvider<CounterNotifier, Counter>(
  CounterNotifier.new,
);

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifier Provider'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(counterProvider.notifier).reset(),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('${count.value}', style: const TextStyle(fontSize: 40)),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => ref.read(counterProvider.notifier).decrement(),
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => ref.read(counterProvider.notifier).increment(),
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
