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
  Future<void> delete(String id)async{
    FirebaseFirestore.instance.collection('students').doc(id).delete();
  }
  

  TextEditingController participation_markController = TextEditingController();
  TextEditingController midterm_exam_markController = TextEditingController();
  TextEditingController final_exam_markController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Delete"),
      backgroundColor: Color(0xffe46b10),),
      body: StreamBuilder(
        stream: students.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                      String id = documentSnapshot.id;
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
                        delete(id);
                      },
                      icon: Icon(Icons.delete,color: Color(0xffe46b10),),
                    ),
                      ],
                    ),
                  );
                }, gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8.0,crossAxisSpacing: 8.0),
              ),
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
