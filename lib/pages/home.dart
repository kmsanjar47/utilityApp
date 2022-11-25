import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:versity/pages/about.dart';
import 'package:versity/pages/calculator.dart';
import 'package:versity/pages/converter.dart';

import '../main.dart';
import '../utility/ItemBox.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.grey[800]),
            toolbarHeight: 80,
            shadowColor: Colors.black12,
            backgroundColor: Colors.grey[300],
            actions: [
              Icon(
                CupertinoIcons.profile_circled,
                color: Colors.grey[800],
                size: 47,
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey[300],
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              //Icon
              InkWell(
                onTap: (){

                },
                child: Icon(
                  Icons.account_circle,
                  size: 60,
                  color: Colors.grey[800],
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              //Home
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(color: Colors.black12, width: 3)),
                height: 50,
                width: double.maxFinite,
                child: TextButton(
                    child: const Text(
                      "Home",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    }),
              ),

              const SizedBox(
                height: 10,
              ),

              //Calculator
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(color: Colors.black12, width: 3),
                ),
                height: 50,
                width: double.maxFinite,
                child: TextButton(
                    child: const Text(
                      "Calculator",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Calculator()));
                    }),
              ),

              const SizedBox(
                height: 10,
              ),

              //Converter
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(color: Colors.black12, width: 3),
                ),
                height: 50,
                width: double.maxFinite,
                child: TextButton(
                    child: const Text(
                      "Converter",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Converter()));
                    }),
              ),

              const SizedBox(
                height: 10,
              ),

              //About US
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(color: Colors.black12, width: 3),
                ),
                height: 50,
                width: double.maxFinite,
                child: TextButton(
                    child: const Text(
                      "About US",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutUs()));
                    }),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
//Row: Drawer Icon, User Icon

              const SizedBox(
                height: 10,
              ),
//Welcome

              Text(
                "Welcome",
                style: TextStyle(fontSize: 25, color: Colors.grey[800]),
              ),
              const SizedBox(
                height: 10,
              ),
//Saifullah Anjar
              Text(
                "Saifullah Anjar",
                style: TextStyle(fontSize: 35, color: Colors.grey[800]),
              ),
              const SizedBox(
                height: 25,
              ),
//Please Select One of the following
              Text(
                "Please Select One Of The Following:",
                style: TextStyle(fontSize: 20, color: Colors.grey[800]),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: myItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 2),
                    itemBuilder: (context, index) {
                      return ContentBox(
                          iconPath: myItems[index][1],
                          contentName: myItems[index][0]);
                    }),
              ),
            ],
          ),
        ));
  }
}
