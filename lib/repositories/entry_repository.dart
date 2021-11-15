import 'package:flutter_riverpod/flutter_riverpod.dart';

final entryRepositoryProvider = Provider((_) => EntryRepository());

class EntryRepository {
  final List<String> _entries = [];

  Future addEntry(String entry) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _entries.add(entry);
  }

  Future removeEntry(String entry) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _entries.remove(entry);
  }

  Future<List<String>> allEntries() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _entries;
  }
}
