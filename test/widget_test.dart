import 'package:animated_gallery_screen/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Gallery screen renders title', (WidgetTester tester) async {
    await tester.pumpWidget(const AnimatedGalleryApp());

    expect(find.text('Animated Gallery'), findsOneWidget);
  });
}
