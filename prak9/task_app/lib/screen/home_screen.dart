import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/note.dart';
import 'package:task_app/models/notes_operation.dart';
import 'package:task_app/screen/add_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        child: Icon(Icons.add, size: 30, color: Colors.lightBlue[100]),
        backgroundColor: Colors.white,
      ),
      appBar: AppBar(
        title: Text(
          'Task Manager',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<NotesOperation>(
        builder: (context, NotesOperation data, child) {
          return ListView.builder(
            itemCount: data.getNotes.length,
            itemBuilder: (context, index) {
              return NotesCard(data.getNotes[index]);
            },
          );
        },
      ),
    );
  }
}

class NotesCard extends StatelessWidget {
  final Note note;

  NotesCard(this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.description,
            style: TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
