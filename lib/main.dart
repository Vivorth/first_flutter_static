
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

  Color background = Colors.red[300];
  List<NetworkImage> image_slider(){
    List<NetworkImage> image_slider = [];
    String image_slider_string = "https://i.ibb.co/PFL7Fq8/Pics-Art-12-21-11-48-42.jpg,https://4.bp.blogspot.com/-OcekJkLBDlM/Vr_ViV1nJlI/AAAAAAAAKLw/jAS8Hqy59uI/s1600/C004.png,https://movie-khmer.com/wp-content/uploads/preng-nitean-snae-inker.jpg,https://4.bp.blogspot.com/-PIePDEDsBPQ/XShZhV7V0xI/AAAAAAAACBo/VjkRt_Z8EZ8mb35GKOal3meRwetSvExpwCLcBGAs/s1600/Nisai%2BSnae%2BDav%2BTep.jpg,https://3.bp.blogspot.com/-ybM_eUdsdJs/W5YSrrHT6ZI/AAAAAAAAAH8/G41JSdpYldQJ84TKR9PZoBEs5elaDydgQCLcBGAs/s1600/sna.png";
    var split_image_slider = image_slider_string.split(",");
    for(var i=0;i<split_image_slider.length;i++){
      image_slider.add(new NetworkImage(split_image_slider[i]));
    }
    return image_slider;
  }
  List<String> image() {
    String image = "https://khmermov.com/images/som-nak-tvear-6-5fd60a515fe4c.png,https://khmermov.com/images/yuthisil-tong-fang-pou-baiy-5fd4d58f5e0b8.png,https://khmermov.com/images/5e88951b30e38.png,https://khmermov.com/images/5e88a911f396e.png,https://khmermov.com/images/slak-banhchea-daek-bombaek-piphup-kun-5fae68c212298.png,https://khmermov.com/images/mohit-thirith-tmor-tep-ii-5f31d49b47ee7.png,https://khmermov.com/images/dav-tep-nisaiy-sneh-5f7209690c3a2.png,https://khmermov.com/images/kumnum-chheam-pdach-nisaiy-5f720b4abc883.png,https://khmermov.com/images/sdech-bro-dal-5fa67566ece9d.png,https://khmermov.com/images/pyus-kambet-hors-jun-anatha-5f720ec7dcf81.png,https://khmermov.com/images/nisaiy-sneh-2-cheat-ii-5eb1463f5d1ee.png,https://khmermov.com/images/taxi-chab-kmouch-ii-5f951c0956645.png,https://khmermov.com/images/en-nisaiy-sneh-10-cheat-5f73206479fd2.png,https://4.bp.blogspot.com/-gmDSG3Bff_k/WtBFPU5JFnI/AAAAAAAAF5E/S1x2xXhYgc86b1N3ND9pbqm9uOZhl-ecQCLcBGAs/w1200-h630-p-k-no-nu/Athireach-Chom-Bang.png,https://1.bp.blogspot.com/-ZuP9zxtNmOw/WWKfIjDb9pI/AAAAAAAAGJM/8WsGysd9tzk7PNARC5DmpFAUIhqEIki0QCLcBGAs/s1600/All%2BMen%2BAre%2BBrother%2B22222.jpg,https://1.bp.blogspot.com/-OyeE_T5vo4M/XSlHL3-hmpI/AAAAAAAACGg/_efd-Sf-chIxlRHBa88wQDiyjm_Wyd94QCLcBGAs/s1600/Entry%2BTep%2BSena%2BKlahan%2B%255B50END%255D.png,https://movie-khmer.com/wp-content/uploads/preng-nitean-snae-inker.jpg,https://1.bp.blogspot.com/-H9GG7bu5HJM/X4gNEZgtduI/AAAAAAAATCo/7d5Sm-moAF4hPVjUXNvFBDtuc7n8cqyGACNcBGAsYHQ/s320/ready%2B%25281%2529.png,https://1.bp.blogspot.com/-RMLkXSwztLw/X3HqpYX-gMI/AAAAAAAAKgk/YHjBnXBHbKwg16WP9nK25nwiXOplFZw5wCLcBGAsYHQ/s320/dav.jpg,https://khmermov.com/images/yuthisil-tep-thida-chok-tip-5e93ef29b4ab7.png,https://4.bp.blogspot.com/-uuLk_SVatZM/Xx0FNFzFvqI/AAAAAAAADnw/9EQMBAv64J0OnEoAGCaB9nm5jcnPYCTAACLcBGAsYHQ/w680/Leap%2BSamnang%2BTian%2BBao%2B-%2BLucky%2BTian%2BBao%2B%25282016%2529.jpg,https://4.bp.blogspot.com/-svmMQdHNJ6k/XI3RAoVYKyI/AAAAAAAAERY/u_xjQRn3h_ETAsaYehMy60JMol-6V8qAQCLcBGAs/s1600/Sromol%2BDav%2BAthireach.jpg,https://phumikhmerblog.files.wordpress.com/2019/03/pjus-sneah-knong-piphub-online.png,https://movie-khmer.com/wp-content/uploads/ethipol-kumpi-jukjeata.jpg,https://www.khmerkomsan.net/uploads/thumbs/8cc7e350b-1.jpg";
    var split_image = image.split(",");
    return split_image;
  }
  List<String> title(){
    String title = "សំណាក់ទ្វា៦,យុទ្ធសិល្ប៍តុងហ្វាងពូប៉ាយ,អ្នកក្លាហានទាំង៣ឆ្លងភព,ព្រះនាងអធិរាជឡានលីង,ស្លាកបញ្ជាដែកបំបែកពិភពគុន,មហិទ្ធិឬទ្ធិថ្មទេព,ដាវទេពនិស្ស័យស្នេហ៍,គំនុំឈាមផ្ដាច់និស្ស័យ,ស្ដេចប្រដាល់,ព្យុះកាំបិទហោះជនអនាថា,និស្ស័យស្នេហ៍២ជាតិ,តាក់ស៊ីចាប់ខ្មោច វគ្គ២,និស្ស័យស្នេហ៍១០ជាតិ,អធិរាជចម្បាំង,បងប្អូនអ្នកក្លាហាន,ទេពឥន្ទ្រីសេនាក្លាហាន,ព្រេងនិទានស្នេហ៍អ៊ីនកឺ,អ្នកក្លាហានជ្រែកពិភពគុណ,និស្ស័យស្នេហ៍ដាវទេព,យុទ្ធសិល្ប៏ទេពធីតាឈូកទិព្វ,លាភសំណាងទានប៉ាវ,ស្រមោលដាវអធិរាជ,ព្យុះស្នេហ៍ពិភពអនឡាញ,ឥទ្ធិពលគម្ពីជោគជតា,ទេពឥន្ទ្រីបក្សីស្នេហ៍";
    var split_title = title.split(",");
    return split_title;
  }
  List<String> image1() {
    String image = "https://khmermov.com/images/virak-neary-jrek-piphob-kun-5e933295d27e8.png,https://khmermov.com/images/songkream-yuthsil-sat-tep-5e96807d3f81b.png,https://khmermov.com/images/trokoul-nak-khlahan-5eb65124285fd.png,https://khmermov.com/images/preah-moha-ksatrey-yany-5eeb07674df60.png,https://khmermov.com/images/kompoul-boros-cao-cao-5f8c4b8db6cc3.png,https://khmermov.com/images/piphob-chomnougn-sahak-savat-tmey-5f73259fe189c.png,https://khmermov.com/images/krou-pet-bom-baek-kdey-atkombang-5f73229c5b368.png,https://khmermov.com/images/kompoul-yuthisil-neang-tep-macha-5f731cfd139d2.png,https://khmermov.com/images/sena-tep-bongkrab-beysach-5eeb07154e8d1.png,https://khmermov.com/images/en-kompoul-me-tab-srey-moulan-5f62225137d46.png,https://khmermov.com/images/-lung-sne-pros-machha-5f54ce65a89c7.png,https://khmermov.com/images/brotibat-kar-krom-khla-hos-ii-5ecd5849d9cd0.png,https://khmermov.com/images/preah-neang-bdol-kay-5f6b5755abd51.png,https://4.bp.blogspot.com/-hzAkhPtUMtg/XE6q4-GxLBI/AAAAAAAABUY/jaRTqnvTZS0Gjj1dFT1OWuYA0ZF0_zO4QCLcBGAs/s1600/kream.png,https://i.mycdn.me/i?r=AEE-HZfz734vGAKlsp5gLh-p6fnx31MtrWxJH3tWrJSzt2Qh-8NQseQ-fl_Zeg2dsJfyTdBM-RkmUM0dkZCZ98UR&fn=external_8,https://movie-khmer.com/wp-content/uploads/mohethirith-dav-tep-chusen.jpg,https://movie-khmer.com/wp-content/uploads/jrek-komphaeng-neakreach.jpg,https://4.bp.blogspot.com/-N1iorFje7YE/W5y24dfTcWI/AAAAAAAAAVU/zapbr1wJ4r0vP7SEvQ2PD8ildheYawIiACLcBGAs/s1600/tep1.jpg,https://www.phumi7.net/uploads/images/Nak-Bromanh-Atitep_1558336647.png,https://movie-khmer.com/wp-content/uploads/nak-klahan-dav-tep-2020.jpg,https://4.bp.blogspot.com/-68K-Bju59dI/XNTlFvJw_qI/AAAAAAAABuQ/1hjpoW-D5iElCrqQhYx0l_kp8-RBXPHwACLcBGAs/s1600/davtep.png,https://4.bp.blogspot.com/-PIePDEDsBPQ/XShZhV7V0xI/AAAAAAAACBo/VjkRt_Z8EZ8mb35GKOal3meRwetSvExpwCLcBGAs/s1600/Nisai%2BSnae%2BDav%2BTep.jpg,https://3.bp.blogspot.com/-3_OR3mHHNIE/Xz6NlS8hSaI/AAAAAAAAR0o/XGtZoLsIjDsaW1oe3lU1K1JoqdfhzZvFQCNcBGAsYHQ/s320/ready.png,https://movie-khmer.com/wp-content/uploads/vieak-neary-hua-mulan.jpg,https://thailakornfullhd.com/images/movie/74/dav-komjat-beysach.png";
    var split_image = image.split(",");
    return split_image;
  }
  List<String> title1(){
    String title = "វីរនារីជ្រែកពិភពគុណ,សង្គ្រាមយុទ្ធសិល្ប៍សត្វទេព,ត្រកូលអ្នកក្លាហាន,ព្រះមហាក្សត្រីយ៉ានី,កំពូលបុរសឆាវឆាវ,ពិភពជំនួញសហស្សវត្សរ៍ថ្មី,គ្រូពេទ្យបំបែកក្ដីអាថ៌កំបាំង,កំពូលយុទ្ធសិល្ប៍នាងទេពមច្ចា,សេនាទេពបង្គ្រាបបីសាច,កំពូលមេទ័ពស្រីមូឡាន,លង់ស្នេហ៍ប្រុសមច្ចា,ប្រតិបត្ដិការក្រុមខ្លាហោះ វគ្គ២,ព្រះនាងប្ដូរកាយ,អធិរាជសង្គ្រាម​ ចាវជីឡុង,កំពូលយុទ្ធសិល្ប៍ជីកុង,មហិទ្ធរិទ្ធដាវទេពជូសៀន,ជ្រែកកំផែងនាគរាជ,មហិទ្ធរិទ្ធថ្មទិព្វ,អ្នកប្រមាញ់អទិទេព,អ្នកក្លាហានដាវទិព្វ,និស្ស័យស្នេហ៍ដាវទេព,និស្ស័យស្នេហ៍ដាវទេព,កំពូលសេនាទាំង៤,វីរនារី ហ័រ​ មុឡាន,ដាវកំចាត់បិសាច";
    var split_title = title.split(",");
    return split_title;
  }
  List<String> image2() {
    String image = "https://1.bp.blogspot.com/-QQNdSoEJZpw/Xw84j_vE_TI/AAAAAAAAFDE/FJbxURIC78sfYxN7aPRm8TzEjhVFRHtHwCLcBGAsYHQ/w1200-h630-p-k-no-nu/Nisai%2BSnae%2BTevada%2BChombang.jpg,https://2.bp.blogspot.com/-T4sl2EGxh74/Wn_GvJ6kQjI/AAAAAAAAAbg/hH4Pc8N2yIAoEd3CUBr7jI1-H-3dimDLACLcBGAs/s1600/Nisai%2BSne%2BTevida%2BBey%2BCheat.jpg,https://4.bp.blogspot.com/-OcekJkLBDlM/Vr_ViV1nJlI/AAAAAAAAKLw/jAS8Hqy59uI/s1600/C004.png,https://i.ytimg.com/vi/bxUa-xX8pko/maxresdefault.jpg,https://1.bp.blogspot.com/-vD0BsTwkxQc/Xu7xzaHH7fI/AAAAAAAAE8Q/JICSM8Wb-pgwWrzDLCj69RctwEji056fgCLcBGAsYHQ/s640/PneakNgeaPisesPreahNeangTouch.png,https://i.mycdn.me/image?id=891768913797&t=50&plc=WEB&tkn=*VLp4npszNb_EsR5vgg7McMGsuNo&fn=external_8,https://i.malimarcdn.com/kh/NisaiSneDavBoranHDF.jpg,https://1.bp.blogspot.com/-A2X1WjOf9n8/WF14VbWRMNI/AAAAAAAACqM/4j2cGYhdz6kOBtfh-0fDqfxHHEmdIWqIwCLcB/w1200-h630-p-k-no-nu/Chomnor%2BSne%2BLer%2BVeal%2BKhsach.png,https://movie-khmer.com/wp-content/uploads/tolaka-kanhjrong-tep.jpg,https://1.bp.blogspot.com/-kwqvl_RnZe4/U8vqs0J4kXI/AAAAAAAAC84/1hHsM0vM7Wg/s1600/index.jpg,https://3.bp.blogspot.com/-ybM_eUdsdJs/W5YSrrHT6ZI/AAAAAAAAAH8/G41JSdpYldQJ84TKR9PZoBEs5elaDydgQCLcBGAs/s1600/sna.png,https://thailakornfullhd.com/images/movie/80/jrek-phup-tov-samai-samkok.png";
    var split_image = image.split(",");
    return split_image;
  }
  List<String> title2(){
    String title = "និស្ស័យស្នេហ៍ទេវតាចម្បាំង,និស្ស័យស្នេហ៍ទេវតាបីជាតិ,មហិច្ចតាអ៊ូម៉ីនាង,ព្យុះកាំបិតជនអនាថា,ភ្នាក់ងារពិសេសព្រះនាងតូច,ប្រយុទ្ធទៅកាន់មេឃា,ព្រេងនិទានដាវបុរាណ,ជំនោរស្នេហ៍លើវាលខ្សាច់,តុលាការកញ្ច្រោងទេព,សាមកុក,កំពូលយុទ្ធសិល្ប៍បង្វិលវាសនា,ជ្រែកភពទៅសម័យសាមកុក";
    var split_title = title.split(",");
    return split_title;
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

                  images: image_slider(),


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
                  itemCount: image().length,
                  itemBuilder: (context, index) {
                    return new Container(
                      padding: EdgeInsets.all(5),
                      child: GestureDetector(
                          onTap: () =>
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      load(text: title()[index]))
                              ),
                          child: SizedBox(

                            width: 100,
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeInImage(
                                  image: NetworkImage(image()[index]),
                                  placeholder: AssetImage(
                                      'assets/images/loading.jpg'),
                                  width: 100,
                                  height: 160,
                                  fit: BoxFit.fitHeight,
                                ), Text(title()[index],
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
                  itemCount: image1().length,
                  itemBuilder: (context, index) {
                    return new Container(
                      padding: EdgeInsets.all(5),
                      child: GestureDetector(
                          onTap: () =>
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      load(text: title1()[index]))
                              ),
                          child: SizedBox(

                            width: 100,
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeInImage(
                                  image: NetworkImage(image1()[index]),
                                  placeholder: AssetImage(
                                      'assets/images/loading.jpg'),
                                  width: 100,
                                  height: 160,
                                  fit: BoxFit.fitHeight,
                                ), Text(title1()[index],
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
                  itemCount: image2().length,
                  itemBuilder: (context, index) {
                    return new Container(
                      padding: EdgeInsets.all(5),
                      child: GestureDetector(
                          onTap: () =>
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      load(text: title2()[index]))
                              ),
                          child: SizedBox(

                            width: 100,
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeInImage(
                                  image: NetworkImage(image2()[index]),
                                  placeholder: AssetImage(
                                      'assets/images/loading.jpg'),
                                  width: 100,
                                  height: 160,
                                  fit: BoxFit.fitHeight,
                                ), Text(title2()[index],
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
