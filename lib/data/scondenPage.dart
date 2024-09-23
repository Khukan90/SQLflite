import 'package:flutter/material.dart';

class scondePage extends StatefulWidget {
  final String? name;
  final String image;
  int id;
  final String Department;
  final double CGPA;

  scondePage(
      {super.key,
      required this.name,
      required this.id,
      required this.image,
      required this.Department,
      required this.CGPA});

  @override
  State<scondePage> createState() => _scondePageState();
}

class _scondePageState extends State<scondePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('${widget.image}'),
              Text(
                'Name: ${widget.name}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                'Student ID: ${widget.id}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                'Department ${widget.Department}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                'CGPA ${widget.CGPA}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
