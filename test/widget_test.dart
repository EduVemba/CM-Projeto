import 'package:flutter_test/flutter_test.dart';
import 'package:projeto/main.dart';

void main() {
  testWidgets('SmartTravel smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartTravelApp());
    expect(find.text('SmartTravel'), findsOneWidget);
  });
}