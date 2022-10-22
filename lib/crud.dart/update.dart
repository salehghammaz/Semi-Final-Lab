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
  Future<void> update(
      DocumentSnapshot? documentSnapshot, BuildContext context) async {
    if (documentSnapshot != null) {
      participation_markController.text =
          documentSnapshot['participation_mark'];
      midterm_exam_markController.text = documentSnapshot['midterm_exam_mark'];
      final_exam_markController.text = documentSnapshot['final_exam_mark'];

      showBottomSheet(
        context: context,
        constraints: BoxConstraints(maxHeight: 400.0),
        backgroundColor: Color(0xffe46b10),
        builder: (context) {
          return Center(
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
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
                      String finalExam =final_exam_markController.text;
                      await students.doc(documentSnapshot.id).update({
                          'participation_mark': participate,
                          'midterm_exam_mark': mid,
                          'final_exam_mark': finalExam
                        });
                        participation_markController.clear();
                        midterm_exam_markController.clear();
                        final_exam_markController.clear();
                        Navigator.of(context).pop();
                    },
                    child: Text("update")),
              ],
            ),
          );
        },
      );
    }
  }

  TextEditingController participation_markController = TextEditingController();
  TextEditingController midterm_exam_markController = TextEditingController();
  TextEditingController final_exam_markController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update"),
        backgroundColor: Color(0xffe46b10),
      ),
      body: Center(
        child: StreamBuilder(
          stream: students.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8),
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
                    elevation: 16.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Participation mark: ' + documentSnapshot['participation_mark']),
                        const SizedBox(height: 8.0,),
                    Text('Midterm exam mark: ' +documentSnapshot['midterm_exam_mark']),
                    const SizedBox(height: 8.0,),
                    Text('Final exam mark: ' +documentSnapshot['final_exam_mark']),
                    const SizedBox(height: 16.0,),
                    IconButton(
                      onPressed: () {
                        update(documentSnapshot,context);
                      },
                      icon: Icon(Icons.edit,color: Color(0xffe46b10),),
                    ),
                      ],
                    ),
                  );
                  },
                ),
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
