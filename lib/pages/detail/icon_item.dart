import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconItem extends StatelessWidget {
  final IconData icon;
  final int value;
  final Function onPressed;

  const IconItem(this.icon, this.value, this.onPressed, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Column(children: [
        Icon(icon, color: Get.textTheme.caption.color),
        Text(
          '$value',
          style: Get.textTheme.caption.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ]),
    );
  }
}
