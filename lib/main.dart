import 'package:flutter/material.dart';
import 'package:friends_party_crema/models/friend.dart';
import 'package:friends_party_crema/providers/invites.dart';
import 'package:friends_party_crema/screens/screen_invited.dart';
import 'package:friends_party_crema/screens/reports.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      builder: (context, child) => MyApp(),
      create: (BuildContext context) => Invites(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "invited": (context) => InvitedScreen(),
        "reports": (context) => Reports(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Friend> friends = [
    Friend(name: "Mary", email: "mary@mail.com"),
    Friend(name: "Jai", email: "jai@mail.com"),
    Friend(name: "Anas", email: "anas@mail.com"),
    Friend(name: "Zaid", email: "zaid@mail.com"),
    Friend(name: "Salman", email: "salman@mail.com"),
    Friend(name: "Furqan", email: "furqan@mail.com"),
    Friend(name: "Arsalan", email: "arsalan@mail.com"),
    Friend(name: "Nauman", email: "nauman@mail.com"),
    Friend(name: "Hussaan", email: "hussaan@mail.com"),
    Friend(name: "Usman", email: "usman@mail.com"),
  ];

  @override
  Widget build(BuildContext context) {
    final invites = Provider.of<Invites>(context);
    invites.setTotal(friends.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Awesome Friends"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter),
            onPressed: () => Navigator.of(context).pushNamed("reports"),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, idx) {
          return ListTile(
            title: Text(
              friends[idx].name,
            ),
            subtitle: Text(
              friends[idx].email,
            ),
            onTap: () => invites.add(friends[idx]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed("invited"),
        tooltip: 'Invite',
        child: Text("${invites.numberOfFriendsInvited()}"),
      ),
    );
  }
}
