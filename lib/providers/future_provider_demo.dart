import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// A function that simulates fetching a list of todos.
Future<List<String>> fetchTodos() async {
  await Future.delayed(const Duration(seconds: 2));
  return ['Learn Riverpod', 'Build an app', 'Deploy the app'];
}


final todosProvider = FutureProvider.autoDispose<List<String>>((ref) {
  return fetchTodos();
});


class FutureProviderDemo extends ConsumerWidget {
  const FutureProviderDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the FutureProvider and handle the AsyncValue states.
    final todosAsyncValue = ref.watch(todosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
      ),
      body: Center(
        child: todosAsyncValue.when(
          data: (todos) => ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(todos[index]),
            ),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
      ),
    );
  }
}