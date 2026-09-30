import 'package:flutter_test/flutter_test.dart';
import 'package:loginpage/main.dart';

void main() {
  testWidgets('LearnHub login page test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Check app name
    expect(find.text('LearnHub'), findsOneWidget);

    // Check welcome message
    expect(find.text('Welcome Back!'), findsOneWidget);

    // Check login fields
    expect(find.text('Email Address'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    // Check buttons
    expect(find.text('LOGIN'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
  });
}