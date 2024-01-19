import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logo_game/logo/data.dart';
import 'package:logo_game/logo/first.dart';
import 'package:logo_game/logo/third.dart';

void main() {
  runApp(MaterialApp(
    home: second(),
    debugShowCheckedModeBanner: false,
  ));
}

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  List<bool> temp = List.filled(data.img.length, false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("LEVEL 1"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blue.shade900, Colors.blue.shade400]),
          ),
        ),
        actions: [
          Container(
            width: 40,
            height: 50,
            margin: EdgeInsets.fromLTRB(10, 10, 3, 10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("img/n_bulb_hints.png"))),
          ),
          Container(
            width: 40,
            height: 20,
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 15, 2, 15),
            // color: Colors.brown,
            child: Text("Hints"),
          ),
        ],
      ),
      body: GridView.builder(
        // controller: PageController(initialPage: index),
        itemCount: data.img.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          String test = first.prefs!.getString("level$index") ?? "";
          String test1 = first.prefs!.getString("level$index") ?? "";
          return GestureDetector(
            onTapUp: (details) {
              print("hello");
              temp[index] = false;
              setState(() {});
            },
            onTapCancel: () {
              print("hi..");
              temp[index] = false;
              setState(() {});
            },
            onTapDown: (details) {
              print("how are you");
              temp[index] = true;
              setState(() {});
            },
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return three(data.img, index);
                  },
                ));
                setState(() {});
              },
              child: Container(
                height: 70,
                width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: (temp[index] == true)
                      ? RadialGradient(
                          colors: [Colors.blue, Colors.blue.shade300],
                          radius: 0.05)
                      : null,
                  border: (test == "yes" || test1 == "yes1")
                      ? Border.all(color: Colors.black, width: 2)
                      : null,
                  borderRadius: (test == "yes" || test1 == "yes1")
                      ? BorderRadius.circular(10)
                      : null,
                ),
                child: (test == "yes" || test1 == "yes1")
                    ? Stack(alignment: Alignment.bottomLeft, children: [
                        Image(
                          image: AssetImage("${data.img[index]}"),
                          fit: BoxFit.fill,
                        ),
                        Image(
                            image: AssetImage("img/check_circle.png"),
                            fit: BoxFit.fill),
                      ])
                    : Image(
                        image: AssetImage("${data.img[index]}"),
                        fit: BoxFit.fill),
              ),
            ),
          );
        },
      ),
    ));
  }
}
