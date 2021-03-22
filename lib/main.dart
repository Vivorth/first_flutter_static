
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'test.dart';
import 'package:gscarousel/gscarousel.dart';
import 'package:test_flutter/load.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main()  async {

  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}


class Home extends StatefulWidget{
  @override

  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  int test_int = 0;
  String a = 'hello';
  List image, image1, image2, title, title1, title2;
  List<NetworkImage> image_slider= [];
  String link;

  retrieveData(){
    CollectionReference collectionReference = Firestore.instance.collection("Drama");
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        String i_slider = snapshot.docs[0].get("chinese_image_slider"); // name of field
        String i = snapshot.docs[0].get("chinese_image");
        String i1 = snapshot.docs[0].get("chinese_image1");
        String i2 = snapshot.docs[0].get("chinese_image2");
        String t = snapshot.docs[0].get("chinese_title");
        String t1 = snapshot.docs[0].get("chinese_title1");
        String t2 = snapshot.docs[0].get("chinese_title2");
        var split_image_slider = i_slider.split(",");

        for(var i=0;i<split_image_slider.length;i++){
          image_slider.add(new NetworkImage(split_image_slider[i]));
        }

        image = i.split(",");
        image1 = i1.split(",");
        image2 = i2.split(",");
        title = t.split(",");
        title1 = t1.split(",");
        title2 = t2.split(",");

      });
    });
  }
  retrieveLink(title){
    CollectionReference collectionReference = Firestore.instance.collection("Drama");
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
         link = snapshot.docs[0].get(title);
      });
    });
  }
ontaps(index){
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          load(text: link))
  );
    retrieveLink(title2[index]);
}
  Color background = Colors.red[300];
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() { // to initilize firebase
      print("completed");
      setState(() {
        retrieveData();
      });
    });
  }






  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red[300],
    ));

    Size size = MediaQuery
        .of(context)
        .size; // to find the size of the screen

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.red[300],
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {

          },),

        title: Text(
          "Rerng Chinese",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,

              letterSpacing: 1.0
          ),

        ),

        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {

            },
          ),

          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              setState(() {
                background = Colors.green[300];
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Container(


            child: Stack(
              children: [Container(
                height: size.height * 0.2 - 10, // 20% of screen size
                decoration: BoxDecoration(color: Colors.red[300],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36))),
              ),

                Positioned(
                  left: 18,
                  top: 20,
                  child: Text("Welcome to\nRerng Chinese", style: TextStyle(

                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
                )
              ],

            ),
          ),
            new Container(

              padding: EdgeInsets.all(10),

              child: new SizedBox(
                height: 160.0,
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 30,
                child: new GSCarousel(

                  images: image_slider,


                  // image slider method

                  indicatorSize: const Size.square(7.0),
                  indicatorActiveSize: const Size(18.0, 8.0),
                  indicatorColor: Colors.white,
                  indicatorActiveColor: Colors.white,
                  animationCurve: Curves.easeInCubic,
                  contentMode: BoxFit.fill,

                  // indicatorBackgroundColor: Colors.greenAccent,
                ),
              ),
            ),

            new Container(
                padding: EdgeInsets.all(10),
                child:
                Row(
                    children: <Widget>[
                      new Expanded(
                        child: Text("រឿងពេញនិយម",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),


                      new Expanded(

                          child: new GestureDetector(
                            onTap: () =>
                                Navigator.push(context,
                                  MaterialPageRoute(builder:
                                      (context) => secondpage()),),
                            child: Text("More>>>"
                              , textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.red,
                              ),
                            ),
                          )
                      ),
                    ]
                )


            ),
            new Container(
              height: 210,

              padding: EdgeInsets.only(left: 5),
              child: ListView.builder(

                  scrollDirection: Axis.horizontal,
                  itemCount: image.length,
                  itemBuilder: (context, index) {
                    return new Container(
                      padding: EdgeInsets.all(5),
                      child: GestureDetector(
                          onTap: () =>
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      load(text: link))
                              ),
                          child: SizedBox(

                            width: 100,
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeInImage(
                                  image: NetworkImage(image[index]),
                                  placeholder: AssetImage(
                                      'assets/images/loading.jpg'),
                                  width: 100,
                                  height: 160,
                                  fit: BoxFit.fitHeight,
                                ), Text(title[index],
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),

                          )

                      ),
                    );
                  }
              ),
            ),

            new Container(
              padding: EdgeInsets.all(10),
              child: new Row(
                children: [
                  new Expanded(
                    child: Text("ទើបមកដល់ថ្មី", style:
                    TextStyle(
                      fontSize: 18,
                    ),),
                  ),
                  new Expanded(
                    child: Text(
                      "More>>>",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                      ),
                    ),)
                ],
              ),
            ),
            new Container(
              height: 210,

              padding: EdgeInsets.only(left: 5),
              child: ListView.builder(

                  scrollDirection: Axis.horizontal,
                  itemCount: image1.length,
                  itemBuilder: (context, index) {
                    return new Container(
                      padding: EdgeInsets.all(5),
                      child: GestureDetector(
                          onTap: () =>
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      load(text: link))
                              ),
                          child: SizedBox(

                            width: 100,
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeInImage(
                                  image: NetworkImage(image1[index]),
                                  placeholder: AssetImage(
                                      'assets/images/loading.jpg'),
                                  width: 100,
                                  height: 160,
                                  fit: BoxFit.fitHeight,
                                ), Text(title1[index],
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),

                          )

                      ),
                    );
                  }
              ),
            ),
            new Container(
                padding: EdgeInsets.all(10),
                child:
                Row(
                    children: <Widget>[
                      new Expanded(
                        child: Text("រឿងភាគបុរាណ",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),


                      new Expanded(

                          child: new GestureDetector(
                            onTap: () =>
                                Navigator.push(context,
                                  MaterialPageRoute(builder:
                                      (context) => secondpage()),),
                            child: Text("More>>>"
                              , textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.red,
                              ),
                            ),
                          )
                      ),
                    ]
                )


            ),
            new Container(
              height: 210,

              padding: EdgeInsets.only(left: 5),
              child: ListView.builder(

                  scrollDirection: Axis.horizontal,
                  itemCount: image2.length,
                  itemBuilder: (context, index) {
                    return new Container(
                      padding: EdgeInsets.all(5),
                      child: GestureDetector(

                          onTap: () =>
                              ontaps(index),


                          child: SizedBox(

                            width: 100,
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeInImage(
                                  image: NetworkImage(image2[index]),
                                  placeholder: AssetImage(
                                      'assets/images/loading.jpg'),
                                  width: 100,
                                  height: 160,
                                  fit: BoxFit.fitHeight,
                                ), Text(title2[index],
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),

                          )

                      ),
                    );
                  }
              ),
            ),
            Image(

              width: 100,
              height: 100,
              image: AssetImage('assets/images/setec.jpg'),
            ),

            Text(
              'hello',
              style: TextStyle(
                  color: Colors.red
              ),
            ),
            Text('$test_int'),
            Image.asset('assets/images/setec.jpg',
              width: 100,
              height: 100,
            ),
            RaisedButton.icon( //button with icon
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      secondpage()), // to go to next activity
                );
                setState(() {
                  a = 'hi';
                  test_int = test_int - 1;
                });
              },

              label: Text(

                'hello',
                style: TextStyle(
                    color: Colors.white
                ),

              ),
              color: Colors.blue,

            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  test_int = test_int + 1;
                });
              },
              color: Colors.red,
              child: Text(
                '$a',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            )
          ],

        ),
      ),


      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            test_int = test_int + 1;
            a = 'click';
          });
        },
        child: Text('hi'),
      ),
    );
  }
}
