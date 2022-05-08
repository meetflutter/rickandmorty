import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:interview/main.dart';

class first extends StatefulWidget {
  jsonview? mm;
  int index;


  first(this.mm, this.index);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundImage: NetworkImage("${widget.mm!.results![widget.index].image}"),
                ),
              ),
              Container(
                height: 60,
                child: Text("${widget.mm!.results![widget.index].name}",style: TextStyle(fontSize: 20),),
              ),
              Container(
                height: 60,
                child: Text("${widget.mm!.results![widget.index].gender}",style: TextStyle(fontSize: 20),),
              ),
              Container(
                height: 60,
                child: Text("${widget.mm!.results![widget.index].status}",style: TextStyle(fontSize: 20),),
              ),
              Container(
                height: 60,
                child: Text("${widget.mm!.results![widget.index].location}",style: TextStyle(fontSize: 20),),
              ),
              Container(
                height: 60,
                child: Text("${widget.mm!.results![widget.index].species}",style: TextStyle(fontSize: 20),),
              ),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return fit();
                },));
              }, child: Text("back"))
            ],
          ),
        ],
      )
    );
  }
}
