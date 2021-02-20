import 'package:flutter/material.dart';

import '../../types.dart';
import '../../widgets/html.dart';

class Content extends StatelessWidget {
  final Target target;
  const Content(this.target, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Html(target.content),
    );
  }
}
