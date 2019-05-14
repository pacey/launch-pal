import 'package:flutter_test/flutter_test.dart';
import 'package:launch_pal/main.dart';

void main() {
  testWidgets('App doesnt crash smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(LaunchPalApp());
  });
}
