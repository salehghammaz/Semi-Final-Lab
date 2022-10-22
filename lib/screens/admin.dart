import 'package:citycafe_app/crud.dart/creat.dart';
import 'package:citycafe_app/crud.dart/delet.dart';
import 'package:citycafe_app/crud.dart/read.dart';
import 'package:citycafe_app/crud.dart/update.dart';
import 'package:citycafe_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      SizedBox(
        height: 60,
      ),
      Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/1.png"))),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: Color(0xffe46b10)),
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Creat()));
                  });
                }),
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 120,
            height: 120,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: Color(0xffe46b10)),
                child: const Text(
                  'Read',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Read()));
                  });
                }),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: Color(0xffe46b10)),
                child: const Text(
                  'Update',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  setState(
                    () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Update()));
                    },
                  );
                }),
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 120,
            height: 120,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: Color(0xffe46b10)),
                child: const Text(
                  'Delet',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {setState(
                    () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Delete()));
                    },
                  );}),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Login_screen()));
          },
          child: Text(
            "back",
            style: TextStyle(fontSize: 15),
          )),
    ])));
  }
}
