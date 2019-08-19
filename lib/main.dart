import 'package:flutter/material.dart';
import 'package:flutter_navigator_exam/DetailedNote.dart';
import 'package:flutter_navigator_exam/Utils/Notes.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notes",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> _notes;

  _handleDetailedViewData(int index) async {
    bool data = await Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailedNote(_notes[index])));
    setState(() {
     _notes[index].setReadState = data; 
    });
  }

  _handleIconDisplay(int index) {
    bool readStatus = _notes[index].getReadState;
    return Icon(readStatus ? Icons.check_circle : Icons.remove_circle,
        color: readStatus ? Colors.greenAccent : Colors.red);
  }

  _HomeScreenState() {
    _notes = Notes.initializeNotes().getNotes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        elevation: 6,
        titleSpacing: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

        },
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.green, width: 1))),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(_notes[index].getTitle),
                  _handleIconDisplay(index),
                ],
              ),
              onTap: () {
                _handleDetailedViewData(index);
              },
            ),
          );
        },
      ),
    );
  }
}
