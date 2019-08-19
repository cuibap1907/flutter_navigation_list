import 'package:flutter/material.dart';
import 'package:flutter_navigator_exam/Utils/Notes.dart';

class DetailedNote extends StatefulWidget {
  Note selectedNote;
  DetailedNote(this.selectedNote);
  @override
  _DetailedNoteState createState() => _DetailedNoteState();
}

class _DetailedNoteState extends State<DetailedNote> {

  Note _selectedNote;
  _handleCheckBox(bool readStatus)
  {
    setState(() {
     _selectedNote.setReadState = readStatus; 
    });
  }

  @override
  Widget build(BuildContext context) {
    this._selectedNote = widget.selectedNote;
    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(onPressed: () {
          Navigator.pop(context, _selectedNote.getReadState);
        }, child: Icon(Icons.arrow_back),),
        backgroundColor: Colors.deepOrange,
        title: Text("Detail note"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                this._selectedNote.getNoteContent,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.green),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Read?", style: TextStyle()),
                Checkbox(value: _selectedNote.getReadState, onChanged: _handleCheckBox,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
