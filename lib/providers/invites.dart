import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:friends_party_crema/models/friend.dart';

class Invites extends ChangeNotifier {
  final List<Friend> _invited = [];
  int _totalFriends = 0;

  UnmodifiableListView<Friend> get invited => UnmodifiableListView(_invited);

  int get totalFriends => _totalFriends;

  numberOfFriendsInvited() => _invited.length;

  void setTotal(int total) {
    _totalFriends = (total >= 0) ? total : _totalFriends;
  }

  void add(Friend friend) {
    if (_invited != null && !_invited.contains(friend)) {
      _invited.add(friend);
      notifyListeners();
    }
  }

  void remove(Friend friend) {
    if (_invited != null && _invited.contains(friend)) {
      _invited.remove(friend);
      notifyListeners();
    }
  }
}
