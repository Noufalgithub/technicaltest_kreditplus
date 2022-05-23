import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:technicaltest_kreditplus/app/data/models/model_products.dart';
import 'package:technicaltest_kreditplus/app/modules/home/views/home_view.dart';

Widget createHomeView() => HomeView();

void main() {
  group('Home View Widget Test', (){
    // BEGINNING OF NEW CONTENT
    testWidgets('Testing if ListView shows up', (tester) async{
      await tester.pumpWidget(createHomeView());
      expect(find.byType(ListView), findsOneWidget);
    });
    // END OF NEW CONTENT
    testWidgets('Testing Scrolling', (tester) async {
      await tester.pumpWidget(createHomeView());
      expect(find.text('Item 0'), findsOneWidget);
      await tester.fling(find.byType(ListView), Offset(0, -200), 3000);
      await tester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
    });
  });
}