import 'package:flutter_test/flutter_test.dart';
import 'package:zhihu/main.dart';

void main() {
  testWidgets('Widget test', (tester) async {
    await tester.pumpWidget(App());
  });
}
