import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';
import 'package:patrol_testing/main.dart';

void main() {
  patrolWidgetTest(
    'counter is incremented when plus button is tapped',
    (PatrolTester $) async {
      await $.pumpWidget(const MyApp());

      expect($('0'), findsOneWidget);
      expect($('-1'), findsNothing);

      await $(Icons.add).tap();

      expect($('0'), findsNothing);
      expect($('1'), findsOneWidget);
    },
  );
}
