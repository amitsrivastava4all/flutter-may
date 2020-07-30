import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class Ads extends StatefulWidget {
  @override
  _AdsState createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  static String testDevice = "testDevice";
  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: <String>[],
    birthday: new DateTime.now(),
    keywords: <String>['flutter', 'app', 'learn'],
    childDirected: true,
  );
  BannerAd bannerAd;
  BannerAd createBannerAd() {
    return new BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        //adUnitId: 'ca-app-pub-543543543/99828353454353458282',
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent e) {
          print("Mobile Ad Event $e");
        });
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    //.initialize(appId: 'ca-app-pub-65475676732~656757567');
    bannerAd = createBannerAd()
      ..load()
      ..show(anchorType: AnchorType.bottom);
  }

  @override
  void dispose() {
    super.dispose();
    bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ads'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'Ads Demo',
              style: TextStyle(fontSize: 32),
            )
          ],
        ),
      ),
    );
  }
}
