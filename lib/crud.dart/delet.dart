import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Delete extends StatefulWidget {
  const Delete({super.key});

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  CollectionReference students =
      FirebaseFirestore.instance.collection("students");
  Future<void> delete([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      participation_markController.text =
          documentSnapshot['participation_mark'];
      midterm_exam_markController.text = documentSnapshot['midterm_exam_mark'];
      final_exam_markController.text = documentSnapshot['final_exam_mark'];
    }
    await showBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            TextField(
                controller: participation_markController,
                obscureText: false,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true)),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: midterm_exam_markController,
                obscureText: false,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true)),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: final_exam_markController,
                obscureText: false,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true)),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  String participate = participation_markController.text;
                  String mid = midterm_exam_markController.text;
                  double? finalExam =
                      double.tryParse(final_exam_markController.text);
                  if (finalExam != null) {
                    await students.doc(documentSnapshot!.id).delete();
                    participation_markController.text = "";
                    midterm_exam_markController.text = "";
                    final_exam_markController.text = "";
                    Navigator.of(context).pop();
                  }
                },
                child: Text("delete"))
          ],
        );
      },
    );
  }

  TextEditingController participation_markController = TextEditingController();
  TextEditingController midterm_exam_markController = TextEditingController();
  TextEditingController final_exam_markController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: students.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {
                        delete(documentSnapshot);
                      },
                      icon: Icon(Icons.delete),
                    ),
                    trailing: Text(documentSnapshot['participation_mark']),
                    title: Text(documentSnapshot['midterm_exam_mark']),
                    subtitle: Text(documentSnapshot['final_exam_mark']),
                  ),
                );
              },
            );
          }
          return Container(
            child: Text("fail"),
          );
        },
      ),
    );
  }
}
