import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:infinitescroll_ads_payments/db/dboperations.dart';
import 'package:infinitescroll_ads_payments/screens/list.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  DbOperation _db = DbOperation.getInstance();
  int counter = 61;
  String appId = "ca-app-pub-1731820572613538~5049758570";
  BannerAd myBanner;

  BannerAd buildBannerAd() {
    return BannerAd(
        adUnitId: 'ca-app-pub-1731820572613538/5826711678',
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner.show();
          }
        });
  }

  initState() {
    FirebaseAdMob.instance.initialize(appId: appId);
    myBanner = buildBannerAd()..load();
  }

  _addNewEmp() {
    _db.addEmp(counter, "Z$counter", (counter.toDouble() + 1000));
    counter++;
  }

  _viewEmpList() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => ListScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Emp'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Add'),
                onPressed: () {
                  _addNewEmp();
                },
              ),
              RaisedButton(
                child: Text('View'),
                onPressed: () {
                  _viewEmpList();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
