import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timber/edit_timer2.dart';
import 'add_timer.dart';
//import 'package:firebase_database/firebase_database.dart';
//Vidéo TUTO Trés important a reprendre ! : https://www.youtube.com/watch?v=dauYyOXsogw
// PArtie 3.1
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  const config = FirebaseOptions(
      apiKey: "AIzaSyA5zCsKzRsmJoFwWW0XJ_oUTOPe9ZQRKTM",
      appId: "1:388890135059:web:17df6f5af959cbadd04de6",
      messagingSenderId: "388890135059",
      projectId: "test-22f99"
  );


  await Firebase.initializeApp(options: config);
  runApp(const MyApp());

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional


}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData.dark(),
      title: 'Timber',
      home:const HomePage(),
    );
  }

}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar (
        title: const Text('Timber'),
        leading:  IconButton(
          icon: const Icon(Icons.add),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
              return const AddPage();
            },
            fullscreenDialog: true,


            ));

        },),
      ),
      body: TimerInfo(),
    );
  }

}

class TimerInfo extends StatefulWidget {
  const TimerInfo({Key? key}) : super(key: key);

  @override
  _TimerInfoState createState() => _TimerInfoState();
}


class _TimerInfoState extends State<TimerInfo> {

final Stream<QuerySnapshot> _timerStream =
    FirebaseFirestore.instance.collection('Timer').snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: _timerStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (snapshot.hasError){
          return Text('Something went wrong');
        }
        if (snapshot.connectionState ==ConnectionState.waiting){
          return Text("Loading");
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map <String, dynamic> Timer = document.data()! as Map<String,
                dynamic>;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [

                  MaterialButton(

                    child: Text('Slot'),

                    onPressed: () {
                      //log('index: itemBuilder');
                      /*itemCount: snapshot.data!.docs.length,

                      itemBuilder: (_, index) {
                      /*itemBuilder: (_, index) {
                      Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => editTimer(docid: snapshot.data!.docs[index])));*/
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return editTimer(docid: snapshot.data!.docs[index]);

                      },

                        fullscreenDialog: true,


                      ));*/
                     // log('index: fd');
                ListView.builder(

                itemCount: snapshot.data!.docs.length,

                itemBuilder: (_, index) {
                  log('index: fdhlj');
                  log('index: $index');
                  return GestureDetector(
                    onTap: () {

                              //editTimer(docid: snapshot.data!.docs[index]),
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return editTimer(docid: snapshot.data!.docs[index]);
                      },
                        fullscreenDialog: true,
                        ),
                      );
                    });


            });
            },
                  ),


                  Padding(

                    padding: const EdgeInsets.symmetric(horizontal: 8),

                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Text(
                                  Timer['name'],
                                  style: const TextStyle (
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),

                                ),
                                const Text('Description'),
                                Text(Timer['description'].toString()),
                                const Text('Heure de fin'),
                                Text(Timer['DateTime'].toString()),
                              ],
                            ),

            ),

            ],
            ),
            );






          }).toList(),
    );

        },
    );
  }
}
