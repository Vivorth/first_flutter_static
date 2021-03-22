import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() =>  runApp(MaterialApp(

));

class load extends StatefulWidget{
  var text;

  load({Key key, this.text}) : super(key: key);  // to pass data from another activity
_load createState() => _load();
}

class _load extends State<load>{
bool inter = false;
String ID = "484210789272072_484210882605396";
var map = {'សំណាក់ទ្វា៦':'https://khmermov.com/movie/som-nak-tvear-6', 'យុទ្ធសិល្ប៍តុងហ្វាងពូប៉ាយ':'https://khmermov.com/movie/yuthisil-tong-fang-pou-baiy', 'អ្នកក្លាហានទាំង៣ឆ្លងភព':'https://khmermov.com/movie/nak-klahan-tang-3-chlong-phop', 'ព្រះនាងអធិរាជឡានលីង':'https://khmermov.com/movie/preah-neang-athireach-lan-ling', 'ស្លាកបញ្ជាដែកបំបែកពិភពគុន':'https://khmermov.com/movie/slak-banhchea-daek-bombaek-piphup-kun', 'មហិទ្ធិឬទ្ធិថ្មទេព':'https://khmermov.com/movie/mohit-thirith-tmor-tep-ii', 'ដាវទេពនិស្ស័យស្នេហ៍':'https://khmermov.com/movie/dav-tep-nisaiy-sneh', 'គំនុំឈាមផ្ដាច់និស្ស័យ':'https://khmermov.com/movie/kumnum-chheam-pdach-nisaiy', 'ស្ដេចប្រដាល់':'https://khmermov.com/movie/sdech-bro-dal', 'ព្យុះកាំបិទហោះជនអនាថា':'https://khmermov.com/movie/pyus-kambet-hors-jun-anatha', 'និស្ស័យស្នេហ៍២ជាតិ':'https://khmermov.com/movie/nisaiy-sneh-2-cheat-ii', 'តាក់ស៊ីចាប់ខ្មោច វគ្គ២':'https://khmermov.com/movie/taxi-chab-kmouch-ii', 'និស្ស័យស្នេហ៍១០ជាតិ':'https://khmermov.com/movie/en-nisaiy-sneh-10-cheat', 'អធិរាជចម្បាំង':'https://movie-khmer.com/athireach-chombang/', 'បងប្អូនអ្នកក្លាហាន':'https://movie-khmer.com/nak-klahan-liangshan-108/', 'ទេពឥន្ទ្រីសេនាក្លាហាន':'https://movie-khmer.com/entry-tep-sena-klahan/','ព្រេងនិទានស្នេហ៍អ៊ីនកឺ':'https://movie-khmer.com/preng-nitean-snae-inker/', 'អ្នកក្លាហានជ្រែកពិភពគុណ':'https://movie-khmer.com/nak-klahan-pus-mekh-jrek-piphup-kun/', 'និស្ស័យស្នេហ៍ដាវទេព':'https://movie-khmer.com/dav-tep-nisai-snae/', 'យុទ្ធសិល្ប៏ទេពធីតាឈូកទិព្វ':'https://movie-khmer.com/yuthsil-tep-thida-jok-tep/', 'លាភសំណាងទានប៉ាវ':'https://movie-khmer.com/leap-somnang-tianbao/', 'ស្រមោលដាវអធិរាជ':'https://movie-khmer.com/sromol-dav-athireach/', 'ព្យុះស្នេហ៍ពិភពអនឡាញ':'https://movie-khmer.com/pyus-snae-piphup-online/', 'ឥទ្ធិពលគម្ពីជោគជតា':'https://movie-khmer.com/ethipol-kumpi-jukjeata/', 'ទេពឥន្ទ្រីបក្សីស្នេហ៍':'https://movie-khmer.com/tep-entry-baksey-snae-2014/','វីរនារីជ្រែកពិភពគុណ':'https://khmermov.com/movie/virak-neary-jrek-piphob-kun', 'សង្គ្រាមយុទ្ធសិល្ប៍សត្វទេព':'https://khmermov.com/movie/songkream-yuthsil-sat-tep', 'ត្រកូលអ្នកក្លាហាន':'https://khmermov.com/movie/trokoul-nak-khlahan', 'ព្រះមហាក្សត្រីយ៉ានី':'https://khmermov.com/movie/preah-moha-ksatrey-yany', 'កំពូលបុរសឆាវឆាវ':'https://khmermov.com/movie/kompoul-boros-cao-cao', 'ពិភពជំនួញសហស្សវត្សរ៍ថ្មី':'https://khmermov.com/movie/piphob-chomnougn-sahak-savat-tmey', 'គ្រូពេទ្យបំបែកក្ដីអាថ៌កំបាំង':'https://khmermov.com/movie/krou-pet-bom-baek-kdey-atkombang', 'កំពូលយុទ្ធសិល្ប៍នាងទេពមច្ចា':'https://khmermov.com/movie/kompoul-yuthisil-neang-tep-macha', 'សេនាទេពបង្គ្រាបបីសាច':'https://khmermov.com/movie/sena-tep-bongkrab-beysach', 'កំពូលមេទ័ពស្រីមូឡាន':'https://khmermov.com/movie/en-kompoul-me-tab-srey-moulan', 'លង់ស្នេហ៍ប្រុសមច្ចា':'https://khmermov.com/movie/lung-sne-pros-machha', 'ប្រតិបត្ដិការក្រុមខ្លាហោះ វគ្គ២':'https://khmermov.com/movie/brotibat-kar-krom-khla-hos-ii', 'ព្រះនាងប្ដូរកាយ':'https://khmermov.com/movie/preah-neang-bdol-kay', 'អធិរាជសង្គ្រាមចាវជីឡុង':'https://movie-khmer.com/athireach-songkream-zhao-zi-long/', 'កំពូលយុទ្ធសិល្ប៍ជីកុង':'https://movie-khmer.com/kompoul-yuthsil-jikong/', 'មហិទ្ធរិទ្ធដាវទេពជូសៀន':'https://movie-khmer.com/mohethirith-dav-tep-chusen-2/', 'ជ្រែកកំផែងនាគរាជ':'https://movie-khmer.com/jrek-komphaeng-neakreach/', 'មហិទ្ធរិទ្ធថ្មទិព្វ':'https://movie-khmer.com/mohethirith-thmor-tep-2020/', 'អ្នកប្រមាញ់អទិទេព':'https://movie-khmer.com/nak-bromanh-atitep/', 'អ្នកក្លាហានដាវទិព្វ':'https://movie-khmer.com/nak-klahan-dav-tep-2020/', 'និស្ស័យស្នេហ៍ដាវទេព':'https://movie-khmer.com/dav-tep-nisai-snae/', 'កំពូលសេនាទាំង៤':'https://movie-khmer.com/kompoul-sena-tang-4/', 'វីរនារី ហ័រ​ មុឡាន':'https://movie-khmer.com/vireak-neary-hua-mulan/', 'ដាវកំចាត់បិសាច':'https://movie-khmer.com/dav-komjat-beysach/','និស្ស័យស្នេហ៍ទេវតាចម្បាំង':'https://movie-khmer.com/nisai-snae-tevada-chombang/', 'និស្ស័យស្នេហ៍ទេវតាបីជាតិ':'https://movie-khmer.com/nisai-snae-tevada-3-jeat/', 'មហិច្ចតាអ៊ូម៉ីនាង':'https://movie-khmer.com/mohechata-wu-mei-niang/', 'ព្យុះកាំបិតជនអនាថា':'https://movie-khmer.com/pyus-kambet-hors-jun-anatha/', 'ភ្នាក់ងារពិសេសព្រះនាងតូច':'https://movie-khmer.com/pneakngea-pises-preah-neang-toch/', 'ប្រយុទ្ធទៅកាន់មេឃា':'https://movie-khmer.com/broyuth-tov-kan-mekhea/', 'ព្រេងនិទានដាវបុរាណ':'https://movie-khmer.com/preng-nitean-dav-boran/', 'ជំនោរស្នេហ៍លើវាលខ្សាច់':'https://movie-khmer.com/chumnor-snae-ler-vea-ksach/', 'តុលាការកញ្ច្រោងទេព':'https://movie-khmer.com/tolaka-kanhjrong-tep/', 'សាមកុក':'https://movie-khmer.com/samkok-three-kingdoms/', 'កំពូលយុទ្ធសិល្ប៍បង្វិលវាសនា':'https://movie-khmer.com/kompoul-yuthsil-bongvil-veasna/', 'ជ្រែកភពទៅសម័យសាមកុក':'https://movie-khmer.com/jrek-phup-tov-samai-samkok/'
};
var  link;



@override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() { // to initilize firebase
      print("completed");
      setState(() {
        CollectionReference collectionReference = Firestore.instance.collection("Drama");
        collectionReference.snapshots().listen((snapshot) {
          setState(() {
            link = snapshot.docs[0].get(widget.text);
            print("link = $link");//widger.text is the title which receives from main.dart
          });
        });
      });
    });


    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    //FacebookAudienceNetwork.init(
      //testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6", //optional
    //);
    loadInterstitialAd();

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Rerng Chinese"),
        centerTitle: true,
        backgroundColor: Colors.red[300],
      ),
      body: WebView(
        initialUrl: widget.text,
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
    throw UnimplementedError();
  }
  void loadInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: Platform.isAndroid? ID : "484210789272072_484258302600654",
      listener: (result, value) {
        if (result == InterstitialAdResult.LOADED){
          FacebookInterstitialAd.showInterstitialAd();

        }
        if(InterstitialAdResult.LOADED==false){
          loadInterstitialAd();
          print("ot load");
        }

      },
    );  }


}