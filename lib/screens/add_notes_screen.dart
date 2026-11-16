import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:notes_app/widgets/appbar_leading.dart';

class AddNotesScreen extends ConsumerStatefulWidget {
  const AddNotesScreen({super.key});

  @override
  ConsumerState<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends ConsumerState<AddNotesScreen> {

  void _saveNote() {
    final title = titleController.text.trim();
    if (title.isEmpty) return;

    ref.read(notesProvider.notifier).addNotes(
      NotesModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        description: descriptionController.text.trim(),
        category: 'Personal',
        createdAt: DateTime.now(),
      ),
    );
    Navigator.of(context).pop();
  }
  //final  note = ref.read(notesProvider.notifier);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Add Notes',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        leading: AppbarLeading(
          icon: CupertinoIcons.back,
          onTap: Navigator.of(context).pop,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed:_saveNote,
              icon: Icon(Icons.check)
          )
        ],
      ),

      body: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Text('Title', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                Text('Today : ${DateTime.now()}'),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'add title here',
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(10)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)
                )
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 10,
                controller: descriptionController,
                decoration: InputDecoration(
                    hintText: 'add description here',
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple))
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
