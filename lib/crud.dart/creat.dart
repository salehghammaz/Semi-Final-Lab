import 'package:citycafe_app/crud.dart/read.dart';
import 'package:citycafe_app/screens/admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Creat extends StatefulWidget {
  const Creat({super.key});

  @override
  State<Creat> createState() => _CreatState();
}

class _CreatState extends State<Creat> {
  TextEditingController participatController = TextEditingController();
  TextEditingController midController = TextEditingController();
  TextEditingController finalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/1.png"))),
          ),
          RichText(
            softWrap: false,
            text: TextSpan(
                onEnter: ((event) {
                  print("123");
                }),
                text: 'A',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffe46b10)),
                children: [
                  TextSpan(
                    text: 'dd',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  TextSpan(
                    text: ' Ma',
                    style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
                  ),
                  TextSpan(
                    text: 'rks',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ]),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Participation  Mark",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                width: 35,
              ),
              SizedBox(
                  width: 150,
                  child: TextField(
                      controller: participatController,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true)))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Midterm Exam Mark",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                width: 29,
              ),
              SizedBox(
                  width: 150,
                  child: TextField(
                      controller: midController,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true)))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Final Exam Mark",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                width: 53,
              ),
              SizedBox(
                  width: 150,
                  child: TextField(
                      controller: finalController,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true)))
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 130,
            height: 40,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    backgroundColor: Color(0xffe46b10)),
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  CollectionReference std =
                      FirebaseFirestore.instance.collection('students');
                  std.add({
                    'participation_mark': participatController.text,
                    'midterm_exam_mark': midController.text,
                    'final_exam_mark': finalController.text,
                  });
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => Read()));
                }),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "back",
                style: TextStyle(fontSize: 15),
              )),
        ],
      ),
    );
  }
}
