import 'package:flutter/material.dart';

class CommonPopupContent extends StatefulWidget {
  final Widget content;

  CommonPopupContent({
    Key key,
    this.content,
  }) : super(key: key);

  _CommonPopupContentState createState() => _CommonPopupContentState();
}

class _CommonPopupContentState extends State<CommonPopupContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if(this.mounted){
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.content,
    );
  }
}
