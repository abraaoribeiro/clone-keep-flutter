import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double cardHeight = 170;
    double cardWidth = 170;
    double cardPadding = 15;

    return Scaffold(
      key: _scaffoldKey,
      drawer: new Drawer(
          child: new ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return new ListBody(
            children: <Widget>[
              new DrawerHeader(
                child: new Text("Keep Clone"),
              ),
              new ListTile(
                title: new Text(''),
                onTap: () {},
              ),
              new ListTile(
                title: new Text(''),
                onTap: () {},
              ),
            ],
          );
        },
      )),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
              padding: EdgeInsets.only(top: 40, right: 15, left: 15),
              sliver: SliverAppBar(
                floating: true,
                expandedHeight: 10,
                leading: Container(
                  height: 0,
                  width: 0,
                ),
                primary: false,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    side: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        style: BorderStyle.solid)),
                actions: <Widget>[
                  IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                      icon: Icon(Icons.dehaze)),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Pesquisar suas notas'),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.view_stream)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.account_circle)),
                ],
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              )),
          SliverFillRemaining(
              child: Column(
            children: <Widget>[
              Flexible(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(cardPadding),
                      child: Container(
                        color: Color.fromRGBO(100, 100, 100, 1),
                        height: cardHeight,
                        width: cardWidth,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(cardPadding),
                        child: Container(
                          color: Color.fromRGBO(100, 100, 100, 1),
                          height: cardHeight,
                          width: cardWidth,
                        ))
                  ],
                ),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 17),
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new IconButton(icon: new Icon(Icons.check_box), onPressed: () {}),
              new IconButton(icon: new Icon(Icons.brush), onPressed: () {}),
              new IconButton(icon: new Icon(Icons.mic_none), onPressed: () {}),
              new IconButton(icon: new Icon(Icons.photo), onPressed: () {}),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
      ),
    );
  }
}
