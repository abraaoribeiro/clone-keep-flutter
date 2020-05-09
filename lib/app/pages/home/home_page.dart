import 'package:clone_keep_flutter/app/shared/auth/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage(
      {Key key,
      this.title = "Home",
      String userId,
      AuthRepository auth,
      void Function() logoutCallback})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  AuthRepository authRepository = new AuthRepository();
  FirebaseUser user = null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    authRepository.getCurrentUser().then((user) {
      setState(() {
        this.user = user;
      });
    });
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
                title: new Text('Sair'),
                onTap: () {
                  authRepository.signOut();
                },
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
                    icon: Icon(Icons.dehaze),
                    color: Colors.black,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Pesquisar suas notas'),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.view_stream,
                        color: Colors.black,
                      )),
                  _buildAvatar(this.user)
                ],
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              )),
          SliverFillRemaining(
              child: Column(
            children: <Widget>[],
          ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
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

  Widget _buildAvatar(FirebaseUser user) {
    return user != null
        ? CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(this.user.photoUrl == null
                ? 'https://media.istockphoto.com/vectors/male-unknown-user-social-icon-isolated-vector-image-vector-id532327910'
                : this.user.photoUrl),
            backgroundColor: Colors.transparent,
          )
        : Container(
            height: 0,
            width: 0,
          );
  }
}
