import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trapezza_client_app/properties/CustomColors.dart';
import 'package:trapezza_client_app/utils/Accessor.dart';

class CustomBottomAppBarItem {
  CustomBottomAppBarItem({this.mText});
  Widget mText;
}

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({
    this.accessor,
    this.items,
    this.centerItemText,
    this.height: 50.0,
    this.iconSize: 22.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }

  final Accessor accessor;
  final List<CustomBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.accessor.bottomNavBarStatesWrapper.bottomNavBarInActiveState.onEntry(() {
      setState(() {
        _selectedIndex = 4;
      });
    });

    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    CustomBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                getIcon(index),
                item.mText
              ],
            ),
          ),
        ),
      ),
    );
  }

  SvgPicture getIcon(index) {
    switch (index) {
      case 0:
      {
        return SvgPicture.asset(
            'lib/assets/svg/events_icon.svg',
            color: _selectedIndex == 0
              ? CustomColors.cherry
              : CustomColors.darkGrey,
        );
      }

      case 1:
      {
        return SvgPicture.asset(
          'lib/assets/svg/restaurants_icon.svg',
          color: _selectedIndex == 1
              ? CustomColors.cherry
              : CustomColors.darkGrey,
        );
      }

      case 2:
      {
        return SvgPicture.asset(
          'lib/assets/svg/friends_icon.svg',
          color: _selectedIndex == 2
              ? CustomColors.cherry
              : CustomColors.darkGrey,
        );
      }

      case 3:
      {
        return SvgPicture.asset(
          'lib/assets/svg/profile_icon.svg',
          color: _selectedIndex == 3
              ? CustomColors.cherry
              : CustomColors.darkGrey,
        );
      }
    }
  }

  @override
  void setState(fn) {
    if(this.mounted){
      super.setState(fn);
    }
  }
}