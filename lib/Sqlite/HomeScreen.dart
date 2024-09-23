import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:crud/Sqlite/NoteModel.dart';
import 'package:flutter/material.dart';

import 'dataHelper.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  DBHelper? dbHelper;
  late Future<List<NoteModel>> notelist;

  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() async {
    notelist = dbHelper!.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Database'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbHelper!
              .insert(NoteModel(
                  title: "Our Second Project",
                  email: 'Khukan@gmail.com',
                  age: 23,
                  description: "This is our bigest project"))
              .then((val) {
            print("added data");

            setState(() {
              notelist = dbHelper!.getNotesList();
            });
          }).onError((error, stack) {
            print(error.toString());
          });
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: notelist,
              builder: (context, AsyncSnapshot<List<NoteModel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: ValueKey<int>(snapshot.data![index].id!),
                          background: Container(
                            color: Colors.red,
                            child: Icon(Icons.delete),
                          ),
                          onDismissed: (DismissDirection director) {
                            setState(() {
                              dbHelper!.delete(snapshot.data![index].id!);
                              notelist = dbHelper!.getNotesList();
                              snapshot.data!.remove(snapshot.data![index]);
                            });
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Card(
                              child: Column(
                                children: [
                                  Text(snapshot.data![index].title.toString()),
                                  Text(snapshot.data![index].email.toString()),
                                  Text(snapshot.data![index].age.toString()),
                                  Text(snapshot.data![index].description
                                      .toString()),
                                  AnimatedTextKit(
                                      repeatForever: true,
                                      animatedTexts: [
                                        ColorizeAnimatedText(
                                          'Good Morning EveryOne',
                                          textStyle: TextStyle(fontSize: 18),
                                          colors: [
                                            Colors.green,
                                            Colors.pink,
                                            Colors.orange,
                                            Colors.purple,
                                          ],
                                        ),
                                       WavyAnimatedText('Hello good morning'),
                                        TyperAnimatedText('Hello I am Khukan'),
                                        FadeAnimatedText('Here’s an example of how you can implement'),
                                        FlickerAnimatedText('Para aquellos que prefieren hablar'),


                                      ])
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
