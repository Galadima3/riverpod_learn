import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Stream<int> counterStream() {
  return Stream.periodic(const Duration(seconds: 1), (i) => i);
}

final streamCounterProvider = StreamProvider.autoDispose<int>((ref) {
  return counterStream();
});


class StreamCounterWidget extends ConsumerWidget {
  const StreamCounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(streamCounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(streamCounterProvider);
            },
          ),
        ],
      ),
      body: Center(
        child: counter.when(
          data: (count) => Text('Count: $count', style: Theme.of(context).textTheme.headlineMedium),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
      ),
    );
  }
}