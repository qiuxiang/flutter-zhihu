import 'package:flutter/material.dart';

export 'loading.dart';
export 'play_icon.dart';

class Right extends StatelessWidget {
  final Widget child;

  const Right(this.child);

  @override
  Widget build(BuildContext context) {
    return Align(child: child, alignment: Alignment.centerRight);
  }
}

class Left extends StatelessWidget {
  final Widget child;

  const Left(this.child);

  @override
  Widget build(BuildContext context) {
    return Align(child: child, alignment: Alignment.centerLeft);
  }
}
