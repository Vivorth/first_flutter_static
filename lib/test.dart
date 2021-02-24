
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_flutter/load.dart';

void main() => runApp(MaterialApp(
  home: secondpage(),
));

class secondpage extends StatefulWidget{
  _secondpage createState() => _secondpage();
}

class _secondpage extends State<secondpage>{


  @override
  Widget build(BuildContext context) {
    List<String> list = ["1","2","3","4"];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Rerng Chinese"),
        elevation: 0.5,
        backgroundColor: Colors.red[300],
        actions: [
        IconButton(icon: Icon(Icons.favorite),disabledColor: Colors.white, )],
      ),
      body: Container(
        height: 210,
        margin: const EdgeInsets.all(10),
        
        child: ListView.builder(

    scrollDirection: Axis.horizontal,
    itemCount: list.length, //length of the list
    itemBuilder: (context,index) { // layout of each item

      return GestureDetector(

        onTap: ()=>Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => load()), // to go to next activity
        ),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [Image.asset('assets/images/setec.jpg',fit: BoxFit.fitHeight,height: 150,width: 100,),Text(list[index],)],
        ),

      );
    }),
      ),


        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.red[300],),title: Text("Home"),
          ),BottomNavigationBarItem(
              icon: Icon(Icons.message,color: Colors.red[300],),title: Text("Message"),backgroundColor: Colors.blue
          ),BottomNavigationBarItem(icon: Icon(Icons.notifications,color: Colors.red[300],),title: Text("Notification"))]
        ),
    );
    
    throw UnimplementedError();
  }
}