import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Converter extends StatelessWidget {
  const Converter({Key? key}) : super(key: key);

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
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
