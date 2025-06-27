import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn/models/user_model.dart';

Future<UserModel> fetchUserData() async {
  await Future.delayed(const Duration(seconds: 2));
  return UserModel(
    name: "John Doe",
    email: 'Doe@mail.com',
    phone: '123-456-7890',
  );
}

class UserNotifier extends AsyncNotifier<UserModel> {
  @override
  Future<UserModel> build() async {
    return await fetchUserData();
  }
  Future<void> refreshUser() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => fetchUserData());
  }
}

final userProvider = AsyncNotifierProvider<UserNotifier, UserModel>(
  UserNotifier.new,
);

class UserWidget extends ConsumerWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Notifier Provider'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(userProvider.notifier).refreshUser(),
          ),
        ],
      ),
      body: Center(
        child: userAsyncValue.when(
            data: (user) => Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: Colors.blue.shade200,
                child: Text(
                user.name.isNotEmpty ? user.name[0] : '',
                style: const TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                user.name,
                style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                user.email,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 4),
              Text(
                user.phone,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              ],
            ),
            ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
      ),
    );
  }
}