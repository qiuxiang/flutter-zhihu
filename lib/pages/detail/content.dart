import 'package:flutter/material.dart';

import '../../widgets/html.dart';

class Content extends StatelessWidget {
  final Map target;

  const Content(this.target);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Html(target['content'] ?? ''),
    );
  }
}
