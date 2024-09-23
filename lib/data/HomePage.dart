import 'package:crud/data/scondenPage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _id = TextEditingController();
  TextEditingController _departmant = TextEditingController();
  TextEditingController _cgpa = TextEditingController();

  String images = 'asset/images.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pass'),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('$images'),
            ),
            TextFormField(
              controller: _name,
              decoration: InputDecoration(
                label: Text('Name'),
              ),
            ),
            TextFormField(
              controller: _id,
              decoration: InputDecoration(
                label: Text('Enter your ID'),
              ),
            ),
            TextFormField(
              controller: _departmant,
              decoration: InputDecoration(
                label: Text('Enter your Departmant'),
              ),
            ),
            TextFormField(
              controller: _cgpa,
              decoration: InputDecoration(
                label: Text('Enter your CGPA '),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  final int number = int.tryParse(_id.text) ?? 0;
                  final double cgpa= double.tryParse(_cgpa.text)??0;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => scondePage(
                                name: _name.text,
                                id: number,
                                image: images,
                                Department: _departmant.text, CGPA: cgpa,
                              )));
                },
                child: Text('Sumited Your Data '))
          ],
        ),
      ),
    );
  }
}
