import 'package:citycafe_app/screens/admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  @override
  Widget build(BuildContext context) {
    CollectionReference read =
        FirebaseFirestore.instance.collection('students');
    return Scaffold(appBar: AppBar(backgroundColor:  Color(0xffe46b10),title: Text("Read"),),
      body: SafeArea(
      
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/1.png"))),
              ),
              RichText(
                softWrap: false,
                text:const TextSpan(
                    text: 'Re',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffe46b10)),
                    children: [
                      TextSpan(
                        text: 'ad',
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
              Divider(
                height: 32,
                thickness: 6.0,
              ),
              FutureBuilder<QuerySnapshot>(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,                                                                                         
                    itemBuilder: (context, i) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Participation Mark     :  ${snapshot.data!.docs[i]['participation_mark']}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 248, 152, 8),
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            "Midterm Exam Mark  :  ${snapshot.data!.docs[i]['midterm_exam_mark']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 248, 152, 8),
                            ),
                          )),
                          Center(
                              child: Text(
                            "Final Exam Mark         :  ${snapshot.data!.docs[i]['final_exam_mark']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 248, 152, 8),
                            ),
                          )),
                          Divider(thickness: 3.0,),
                        ],
                      );
                    },
                  );
                },
                future: read.get(),
              ),
              
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                 Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => Admin()));
                },
                child: Text(
                  "back",
                  style: TextStyle(fontSize: 15),
                )),
            ],
          ),
        ),
      ),
    );
  }
}
