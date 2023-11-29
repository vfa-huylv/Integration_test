import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_testing/main.dart' as app;

void main() {
  patrolTest(
    'counter state is the same after going to home and switching apps',
    ($) async {
      app.main();
      await Future.delayed(const Duration(seconds: 1));

      // await $.native.selectFineLocation();
      // if (await $.native.isPermissionDialogVisible()) {
      //   await $.native.grantPermissionWhenInUse();
      // }

      await $.waitUntilVisible(find.byType(Icon));
      await Future.delayed(const Duration(seconds: 1));

      expect($(Icons.add), findsOneWidget);
      expect($('0'), findsOneWidget);
      expect($('-1'), findsNothing);
      await Future.delayed(const Duration(seconds: 1));

      await $(find.byIcon(Icons.add)).tap();
      await Future.delayed(const Duration(seconds: 1));

      expect($('0'), findsNothing);
      expect($('1'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 1));
    },
  );
}
