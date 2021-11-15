import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_riverpod_architecture/pages/home/home_page_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  onAdd(WidgetRef ref) {
    ref.read(homePageControllerProvider).addEntry(DateTime.now().toString());
  }

  onRemove(WidgetRef ref, String entry) {
    ref.read(homePageControllerProvider).removeEntry(entry);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entries Management'),
      ),
      body: ref.watch(entriesProvider).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, trace) => Center(child: Text(error.toString())),
            data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: Text(item),
                  onTap: () => onRemove(ref, item),
                );
              },
            ),
          ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => onAdd(ref),
      ),
    );
  }
}
