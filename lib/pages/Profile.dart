import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  ProfileState createState(){
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {

  @override
  void setState(fn) {
    if(this.mounted){
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}