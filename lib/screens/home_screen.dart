import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:notes_app/providers/search_provider.dart';
import 'package:notes_app/screens/add_notes_screen.dart';
import 'package:notes_app/widgets/Notes_Container.dart';
import 'package:notes_app/widgets/appbar_leading.dart';
import 'package:notes_app/widgets/category_container.dart';

class NotesApp extends ConsumerStatefulWidget {
  const NotesApp({super.key});

  @override
  ConsumerState<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends ConsumerState<NotesApp> {

  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final note = ref.read(notesProvider.notifier);
    return Scaffold(

      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
        leading:AppbarLeading(icon: Icons.menu, onTap: () {  },) ,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),

          // Search box
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(1, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                onChanged: (v) {
                  ref.read(searchQueryProvider.notifier).state = v;
                },
                decoration: InputDecoration(
                  hintText: 'Search Notes',
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(fontSize: 16,color: Colors.grey, fontWeight: FontWeight.w400,),
                  //border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search,size: 20,),
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  //   borderSide: BorderSide(color: Colors.red),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.yellow),
                  ),

                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close, size: 18),
                    onPressed: () {
                      searchController.clear();
                      ref.read(searchQueryProvider.notifier).state = '';
                    },
                  ),
                )

                ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Categories',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: CategoryContainer(),
           ),

          Expanded(
            child: Consumer(
              builder: (context, ref, _) {
                final notes = ref.watch(filteredNotesProvider);

                if (notes.isEmpty) {
                  return const Center(child: Text('No notes yet'));
                }

                return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return NotesContainer(note: notes[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotesScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
