import 'package:flutter_test/flutter_test.dart';
import 'package:loginpage/main.dart';

void main() {
  testWidgets('Online Course App loads correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const OnlineCourseApp());

    expect(find.text('LearnHub'), findsOneWidget);
    expect(find.text('Welcome Back!'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}

