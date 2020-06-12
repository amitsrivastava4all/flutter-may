import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> images = ['https://img.freepik.com/free-photo/product-package-boxes-shopping-bag-cart-with-laptop-online-shopping-delivery-concept_38716-138.jpg?size=626&ext=jpg',
    'https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2F1138257321%2F960x0.jpg%3Ffit%3Dscale'
    ,'https://img.freepik.com/free-photo/female-friends-out-shopping-together_53876-25041.jpg?size=626&ext=jpg']
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    const userImage =
        'https://cdn.iconscout.com/icon/free/png-512/laptop-user-1-1179329.png';
    const url =
        'https://www.usnews.com/dims4/USNEWS/1c985ff/2147483647/thumbnail/640x420/quality/85/?url=http%3A%2F%2Fmedia.beam.usnews.com%2Fd4%2Fc9%2F6234b77a4ede900294850cace7f0%2F200103-womanshoppingbags-stock.jpg';
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            leading: IconButton(
                icon: Icon(Icons.view_list),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                }),
            actions: <Widget>[Icon(Icons.map)],
            elevation: 4,
            titleSpacing: 10,

            //snap: true,
            expandedHeight: media.height / 3,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver AppBar'),
              centerTitle: true,
                background: Swiper(
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) => Image.Network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                  autoplay: true,
                ))
//              background: Image.network(
//                url,
//                fit: BoxFit.cover,
//              ),
            ),
          ),
          // _slider()
        ],
      ),
      key: _scaffoldKey,
      drawer: Drawer(
        child: DrawerHeader(
            child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Amit'),
              accountEmail: Text('amit@yahoo.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(userImage),
              ),
            ),
            InkWell(
              splashColor: Colors.orangeAccent,
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.search),
                title: Text('Search'),
              ),
            ),
            InkWell(
              splashColor: Colors.orangeAccent,
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.account_balance),
                title: Text('Balace'),
              ),
            ),
            InkWell(
              splashColor: Colors.orangeAccent,
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text('Emails'),
              ),
            ),
            InkWell(
              splashColor: Colors.orangeAccent,
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.search),
                title: Text('Search'),
              ),
            )
          ],
        )),
//        child: ListView(
//          children: <Widget>[
//            ListTile(
//              title: Text('A'),
//            ),
//            ListTile(
//              title: Text('B'),
//            )
//          ],
//        ),
      ),
    );
  }
}
