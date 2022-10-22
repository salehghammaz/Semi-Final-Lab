import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/admin.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  CollectionReference students =
      FirebaseFirestore.instance.collection("students");
  Future<void> update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      participation_markController.text =
          documentSnapshot['participation_mark'];
      midterm_exam_markController.text = documentSnapshot['midterm_exam_mark'];
      final_exam_markController.text = documentSnapshot['final_exam_mark'];
    }
    await showBottomSheet(
      context: context,
      builder: (context) {
        return Center(
          child: ListView(
            children: [
              SizedBox(height: 20,),
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
                      await students.doc(documentSnapshot!.id).update({
                        'participation_mark': participate,
                        'midterm_exam_mark': mid,
                        'final_exam_mark': finalExam
                      });
                      participation_markController.text = "";
                      midterm_exam_markController.text = "";
                      final_exam_markController.text = "";
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text("update")),
            ],
          ),
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
      body: Center(
        child: StreamBuilder(
          stream: students.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Center(
                    child: Card(
                      child: ListTile(
                        leading: IconButton(
                          onPressed: () {
                            update(documentSnapshot);
                          },
                          icon: Icon(Icons.edit),
                        ),
                        trailing: Text(documentSnapshot['participation_mark']),
                        title: Text(documentSnapshot['midterm_exam_mark']),
                        subtitle: Text(documentSnapshot['final_exam_mark']),
                      ),
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
      ),
    );
  }
}
