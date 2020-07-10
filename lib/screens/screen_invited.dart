import 'package:flutter/material.dart';
import 'package:friends_party_crema/providers/invites.dart';
import 'package:provider/provider.dart';

class InvitedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Sounds like party!",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Consumer<Invites>(
        builder: (context, invites, child) => (invites.invited.length > 0)
            ? ListView.builder(
                itemCount: invites.invited.length,
                itemBuilder: (context, idx) {
                  return ListTile(
                    title: Text(invites.invited[idx].name),
                    subtitle: Text(invites.invited[idx].email),
                    trailing: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => {invites.remove(invites.invited[idx])},
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                  "No friend invited",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
      ),
    );
  }
}
