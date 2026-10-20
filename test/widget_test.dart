// Smoke test for the portfolio app.

import 'package:flutter_test/flutter_test.dart';

import 'package:my_protfolio/main.dart';

void main() {
  testWidgets('Portfolio app builds and shows the hero', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text("Hi,"), findsOneWidget);
    expect(find.text("I'm Rifat"), findsOneWidget);
  });
}
