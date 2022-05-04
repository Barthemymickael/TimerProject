import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class editTimer extends StatefulWidget {

  DocumentSnapshot docid;
  editTimer({required this.docid});

  @override
  _editTimerState createState() => _editTimerState();

}


class _editTimerState extends State<editTimer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void initState() {
    super.initState();
    title = TextEditingController(text: widget.docid.get('name'));
    content = TextEditingController(text: widget.docid.get('description'));
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifier un timer'),
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'name': title.text,
                'description': content.text,
              }).whenComplete(() {
                Navigator.pop(context);
              });
            },
            child: Text("save"),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pop(context);
              });
            },
            child: Text("delete"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
        side:const BorderSide(color: Colors.white30, width: 1.5),
              ),

              title:Row(
                children:[
                  const Text('Nom:'),
                  Expanded(
                    child: TextField(
                      controller: title,
                      decoration: InputDecoration(
                        hintText: 'title',
                      ),
                      ),
                    ),
                ],
                  ),

              ),
            const SizedBox(height:20),
/*
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side:const BorderSide(color: Colors.white30, width: 1.5),
              ),

              title:Row(
                children:[
                  const Text('description:'),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration (
                        border: InputBorder.none,
                      ),
                      controller: descriptionController,
                    ),
                  ),
                ],
              ),

            ),
            const SizedBox(height:20),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side:const BorderSide(color: Colors.white30, width: 1.5),
              ),

              title:Row(
                children:[
                  const Text('Durée (seconde):'),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration (
                        border: InputBorder.none,
                      ),
                      controller: dureeController,
                    ),
                  ),
                ],
              ),

            ),
            const SizedBox(height:20),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side:const BorderSide(color: Colors.white30, width: 1.5),
              ),

              title:Row(
                children:[
                  const Text('Ordre (Position):'),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration (
                        border: InputBorder.none,
                      ),
                      controller: ordreController,
                    ),
                  ),
                ],
              ),

            ),
            const SizedBox(height:20),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side:const BorderSide(color: Colors.white30, width: 1.5),
              ),

              title:Row(
                children:[
                  const Text('Date de fin:'),
                  Expanded(
                    /*child: Text(


                     // DateFormat(' dd/MM/yyyy Time : KK:mm:ss').format(DateTime.now()),

                    ),*/
                    child: TextField(
                           decoration: const InputDecoration (
                        border: InputBorder.none,
                      ),
                    controller: dateController,
                    ),
                  ),
                ],
              ),

            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: (){
                  FirebaseFirestore.instance.collection('Timer').add({
                    'name': nameController.value.text,
                    'description': descriptionController.value.text,
                    'DateTime': DateFormat(' KK:mm:ss').format(DateTime.now()),
                    'duree': dureeController.value.text,
                    'ordre': ordreController.value.text,
                    'visible': true,
                  });
                  Navigator.pop(context);
                },
                child:const Text('Ajouter') ),*/
          ],
            )

        ),

      );


  }
}















