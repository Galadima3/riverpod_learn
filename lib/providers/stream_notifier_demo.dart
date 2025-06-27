import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LiveCounterNotifier extends AutoDisposeStreamNotifier<int> {
  @override
  Stream<int> build() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (i) => i);
  }

  void restart() {
    ref.invalidateSelf();
  }
}

final liveCounterProvider = StreamNotifierProvider.autoDispose<LiveCounterNotifier, int>(
  LiveCounterNotifier.new,
);


class StreamNotifierDemo extends ConsumerWidget {
  const StreamNotifierDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider to get the AsyncValue.
    final liveCount = ref.watch(liveCounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Notifier'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(liveCounterProvider.notifier).restart();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: liveCount.when(
              data: (count) => Text(
                'Live Count: $count',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('Error: $error'),
            ),
          ),
          const SizedBox(height: 20),
        
        ],
      ),
    );
  }
}