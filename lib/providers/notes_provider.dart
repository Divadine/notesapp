import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/models/notes_model.dart';

class NotesProvider extends Notifier<List<NotesModel>>{

  @override
  List<NotesModel> build(){
    return[
      NotesModel(
        id: '1',
        title: 'Team Meeting',
        description: 'Description of the notes',
        category: 'Work',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }

  void addNotes(NotesModel note){
    state = [...state, note];
  }

  void deleteNotes(String id){
    state = state.where((i) => i.id != id).toList();
  }

  void updateNotes(){
    state = state.map((e) => e.copyWith()).toList();
  }

}
final notesProvider = NotifierProvider<NotesProvider, List<NotesModel>>(NotesProvider.new);