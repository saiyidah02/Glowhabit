// This is a basic Flutter widget test.
import 'package:flutter_test/flutter_test.dart';
import 'package:glowhabit/main.dart';

void main() {
  testWidgets('GlowHabit splash screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GlowHabitApp());

    // Verify that the splash screen shows GlowHabit.
    expect(find.text('GlowHabit'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}
