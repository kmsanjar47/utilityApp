import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: const Icon(
                CupertinoIcons.back,
                size: 40,
              ),
            ),
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.grey[800]),
            toolbarHeight: 80,
            shadowColor: Colors.black12,
            backgroundColor: Colors.grey[300],
          ),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(50),
            height: 300,
            width: 500,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Developed by: \nKhan MD Saifullah Anjar",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Contact: khan.md.saifullah@g.bracu.ac.bd",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
