import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class add_user extends StatelessWidget{
  late String groupid;

  void updateDatabase () async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('groupsId').get();
    if (snapshot.exists == groupid){
      await ref.set({
        "members": {FirebaseAuth.instance.currentUser!.uid: true},
      });
      final DatabaseReference usersRef = FirebaseDatabase.instance.ref("users/${FirebaseAuth.instance.currentUser!.uid}/$groupid");
      usersRef.update("${ref.key}" as Map<String, Object?>);
    }

}

  @override
  Widget build(BuildContext context){
    return Container();
  }
}