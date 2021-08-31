import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupTitle extends StatelessWidget {
  final String title;

  const GroupTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        border: Border.symmetric(
          horizontal: BorderSide(
            width: 0.5,
            color: context.theme.dividerColor,
          ),
        ),
      ),
      child: Text(
        title,
        style: context.textTheme.caption?.copyWith(fontSize: 14),
      ),
    );
  }
}
