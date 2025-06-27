import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textProvider = Provider<String>((ref) => "Hello, Riverpod!");

class ProviderDemo extends ConsumerWidget {
  const ProviderDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(textProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(message)));
  }
}
