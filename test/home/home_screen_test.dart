import 'package:flutter_example/ui/home/home_cubit.dart';
import 'package:flutter_example/ui/home/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  testWidgets(
      'Verify that the counter starts at 0 and increments and decrements correctly',
      (WidgetTester tester) async {
    // Pump the widget with the HomeCubit
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => HomeCubit(),
          child: const HomeScreen(),
        ),
      ),
    );

    // Verify that the counter starts at 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('-1'), findsNothing);
    expect(find.text('1'), findsNothing);

    // Simulate a tap on the increment button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // Rebuild the widget

    // Verify that the counter incremented
    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsNothing);

    // Simulate a tap on the decrement button
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify that the counter decremented
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
}
