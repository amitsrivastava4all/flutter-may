import 'package:flutter/material.dart';
//import ''
class SliverDemo extends StatefulWidget {
  @override
  _SliverDemoState createState() => _SliverDemoState();
}

class _SliverDemoState extends State<SliverDemo> {
  var products = ["Shoes", "Shirts", "Jeans", "Jackets"];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    const url =
        'https://c4.wallpaperflare.com/wallpaper/750/649/236/the-sky-girl-space-night-wallpaper-preview.jpg';
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            leading: Icon(
              Icons.home,
              color: Colors.yellowAccent,
            ),
            actions: <Widget>[Icon(Icons.map)],
            elevation: 4,
            titleSpacing: 10,

            //snap: true,
            expandedHeight: media.height / 3,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver AppBar'),
              centerTitle: true,
                background: Swiper(
                  itemCount: _images.length,
                  itemBuilder: (BuildContext context, int index) => Image.asset(
                    _images[index],
                    fit: BoxFit.cover,
                  ),
                  autoplay: true,
                )),
//              background: Image.network(
//                url,
//                fit: BoxFit.cover,
//              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.orangeAccent,
              child: Text(
                'Clothing',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card(
                elevation: 5,
                child: Text(
                  products[index],
                  style: TextStyle(fontSize: 30),
                ),
              );
            }, childCount: products.length),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.orangeAccent,
              child: Text(
                'Clothing',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 4),
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card(
                elevation: 5,
                child: Text(
                  products[index],
                  style: TextStyle(fontSize: 30),
                ),
              );
            }, childCount: products.length),
          ),
          SliverFillRemaining()
        ],
      )),
    );
  }
}
