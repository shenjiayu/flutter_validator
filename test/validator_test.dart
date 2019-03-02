import 'package:flutter_test/flutter_test.dart';

import '../lib/validator.dart';

void main() {
  test('Validator required should return true if data is not empty', () {
    final result = ValidatorDelegate.delegate('required', 'abc');
    expect(result, true);
  });

  test('Validator required should return false if data is empty', () {
    final result = ValidatorDelegate.delegate('required', '');
    expect(result, false);
  });

  test('Validator number should return true if an int given', () {
    final result = ValidatorDelegate.delegate('number', 123);
    expect(result, true);
  });

  test('Validator number should return true if a decimal given', () {
    final result = ValidatorDelegate.delegate('number', 123.123);
    expect(result, true);
  });

  test('Validator number should return false if a string given', () {
    final result = ValidatorDelegate.delegate('number', 'abc');
    expect(result, false);
  });

  test('Validator number should return false if empty string given', () {
    final result = ValidatorDelegate.delegate('number', '');
    expect(result, false);
  });

  test('Validator number should return true if it is less than a string given', () {
    final result = ValidatorDelegate.delegate('max:6', '5');
    expect(result, true);
  });

  test('Validator number should return false if it is bigger than a string given', () {
    final result = ValidatorDelegate.delegate('max:6', '7');
    expect(result, false);
  });

  test('Validator number should return true if it is bigger than a string given', () {
    final result = ValidatorDelegate.delegate('min:6', '7');
    expect(result, true);
  });

  test('Validator number should return false if it is less than a string given', () {
    final result = ValidatorDelegate.delegate('min:6', '5');
    expect(result, false);
  });

  test('Validator number should return true if it is equal to a string given', () {
    final result = ValidatorDelegate.delegate('equal:6', '6');
    expect(result, true);
  });

  test('Validator number should return false if it is not equal to a string given', () {
    final result = ValidatorDelegate.delegate('equal:6', '5');
    expect(result, false);
  });

  test('Validator number should return true if its size a string given', () {
    final result = ValidatorDelegate.delegate('size:6', '123457');
    expect(result, true);
  });

  test('Validator number should return false if it is not equal to a string given', () {
    final result = ValidatorDelegate.delegate('size:6', '12567');
    expect(result, false);
  });

  test('Validator should use the same object', () {
    final simple = identical(ValidatorDelegate.delegates['required'], ValidatorDelegate.delegates['number']);
    expect(simple, true);

    final numberParameter = identical(ValidatorDelegate.delegates['min'], ValidatorDelegate.delegates['max']);
    expect(numberParameter, true);
  });
}