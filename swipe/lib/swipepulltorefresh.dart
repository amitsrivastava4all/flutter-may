import 'package:flutter/material.dart';

class SwipePullToRefresh extends StatefulWidget {
  @override
  _SwipePullToRefreshState createState() => _SwipePullToRefreshState();
}

class _SwipePullToRefreshState extends State<SwipePullToRefresh> {
  List<String> friends = [];
  initState() {
    super.initState();
    initFriends();
  }

  initFriends() {
    friends.add("ram");
    friends.add("shyam");
    friends.add("ramesh");
    friends.add("amit");
  }

  removeFriend(int index) {
    setState(() {
      friends.removeAt(index);
    });
  }

  int counter = 1;
  Future<Null> addNewFriends() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      friends.add("ram$counter");
    });
    counter++;
    return null;
  }

  friendUndo(int index, String friendName) {
    setState(() {
      friends.insert(index, friendName);
    });
  }

  showMessage(ctx, index, friendName) {
    print("Show SnackBar Call");
    Scaffold.of(ctx).showSnackBar(SnackBar(
      content: Text('Friend Deleted ${friendName}'),
      action: SnackBarAction(
        label: 'UNDO This',
        onPressed: () {
          friendUndo(index, friendName);
        },
      ),
    ));
  }

  TextEditingController ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          // color: Colors.white,
          child: TextField(
            controller: ctrl,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              hintText: 'Type to Search',
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: 32,
            ),
            onPressed: () {
              print("Search Call ${ctrl.text}");
            },
          )
        ],
      ),
      body: Container(
        child: RefreshIndicator(
          color: Colors.white,
          backgroundColor: Colors.blueAccent,
          onRefresh: addNewFriends,
          child: ListView.builder(
            itemCount: friends.length,
            itemBuilder: (context, index) {
              return Dismissible(
                background: Container(
                  color: Colors.orangeAccent,
                  padding: EdgeInsets.only(right: 30),
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.delete_forever,
                    size: 30,
                  ),
                ),
                key: Key(friends[index]),
                onDismissed: (arg) {
                  String currentFriendName = friends[index];
                  removeFriend(index);
                  showMessage(context, index, currentFriendName);
                },
                child: ListTile(
                  title: Text(
                    friends[index],
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
