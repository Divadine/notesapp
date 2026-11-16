import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_model.dart';

class NotesContainer extends StatelessWidget {
  final NotesModel note;
  const NotesContainer({super.key, required this.note});

  String _formatDate(DateTime date){
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final noteDay = DateTime(date.year, date.month,date.day);

    final diff = today.difference(noteDay).inDays;

    if(diff == 0) return 'Today';
    if(diff ==1) return 'Yesterday';
    debugPrint('note: ${note.createdAt} | now: ${DateTime.now()}');
    return '${date.day}/${date.month}';
    //return '${diff.inDays} days ago';
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
         color: Colors.white,
         borderRadius: BorderRadius.circular(14),
         border: Border.all(
           color: Colors.grey
         )
        ),
        child: Column(
          spacing: 15,
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Expanded(child: Text(note.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                // Spacer(),
                Text(_formatDate(note.createdAt),style: TextStyle(fontSize: 18),)
              ],
            ),

            Text(note.description)
          ],
        ),
      ),
    );
  }
}
