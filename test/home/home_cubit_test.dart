import 'package:flutter_example/ui/home/home_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('HomeCubit', () {
    late HomeCubit homeCubit;

    // Run before each test
    setUp(() {
      homeCubit = HomeCubit();
    });

    // Run after each test
    tearDown(() {
      homeCubit.close();
    });

    test('The initial state is zero', () {
      expect(homeCubit.state, equals(0));
    });

    test('The state is reset to zero when reset is called', () {
      homeCubit.increment();
      homeCubit.increment();
      homeCubit.reset();
      expect(homeCubit.state, equals(0));
    });

    blocTest<HomeCubit, int>(
      'emit [1] when increment is called',
      build: () => homeCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [1],
    );

    blocTest<HomeCubit, int>(
      'emit [-1] when decrement is called',
      build: () => homeCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [-1],
    );

    blocTest<HomeCubit, int>(
      'increases two times consecutively',
      build: () => homeCubit,
      act: (cubit) {
        cubit.increment();
        cubit.increment();
      },
      expect: () => [1, 2],
    );

    blocTest<HomeCubit, int>(
      'decreases two times consecutively',
      build: () => homeCubit,
      act: (cubit) {
        cubit.decrement();
        cubit.decrement();
      },
      expect: () => [-1, -2],
    );

    blocTest<HomeCubit, int>(
      'emit [0] when reset is called after increment',
      build: () => homeCubit,
      act: (cubit) {
        cubit.increment();
        cubit.reset();
      },
      expect: () => [1, 0],
    );

    blocTest<HomeCubit, int>(
      'emit [0] when reset is called after decrement',
      build: () => homeCubit,
      act: (cubit) {
        cubit.decrement();
        cubit.reset();
      },
      expect: () => [-1, 0],
    );
  });
}
