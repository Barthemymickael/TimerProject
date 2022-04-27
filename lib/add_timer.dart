import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final dureeController = TextEditingController();
  final ordreController= TextEditingController();
  final dateController = TextEditingController();
  @override
  void initState() {
    super.initState();
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
        title: const Text('Ajouté un timer'),
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
                      decoration: const InputDecoration (
                          border: InputBorder.none,
                        ),
                      controller: nameController,
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
                    'DateTime': dateController.value.text,
                    'duree': dureeController.value.text,
                    'ordre': ordreController.value.text,
                    'visible': true,
                  });
                  Navigator.pop(context);
                },
                child:const Text('Ajouter') ),
          ],
            ),

        ),

      );


  }
}















