import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_riverpod_architecture/repositories/entry_repository.dart';

final entriesProvider = FutureProvider((ref) {
  final entryRepository = ref.watch(entryRepositoryProvider);
  return entryRepository.allEntries();
});

final homePageControllerProvider = Provider((ref) {
  final entryRepository = ref.watch(entryRepositoryProvider);
  return HomePageController(ref: ref, entryRepository: entryRepository);
});

class HomePageController {
  final ProviderRef ref;
  final EntryRepository entryRepository;

  HomePageController({required this.ref, required this.entryRepository});

  addEntry(String entry) {
    entryRepository.addEntry(entry);
    ref.refresh(entriesProvider);
  }

  removeEntry(String entry) {
    entryRepository.removeEntry(entry);
    ref.refresh(entriesProvider);
  }
}
