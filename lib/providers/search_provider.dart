import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:notes_app/models/notes_model.dart';

import 'notes_provider.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final filteredNotesProvider = Provider<List<NotesModel>>((ref) {
  final notes = ref.watch(notesProvider);
  final query = ref.watch(searchQueryProvider).toLowerCase();

  if (query.isEmpty) return notes;

  return notes .where((n) => n.title.toLowerCase().contains(query) ||n.description.toLowerCase().contains(query)) .toList();

});