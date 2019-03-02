import 'package:flutter_validator/validator_interface.dart';

class SizeValidator implements Validator {

  static final SizeValidator _singleton = new SizeValidator._internal();

  factory SizeValidator() {
    return _singleton;
  }

  SizeValidator._internal();

  Map<String, Function> _rules = {
    'size': (dynamic value, double size) {
      Type type = value.runtimeType;
      switch (type) {
        case String:
          return value.toString().length == size;
        case List:
          return (value as List).length;
        default:
          return false;
      }
    }
  };

  bool validate(String rule, dynamic value, String parameter) {
    return _rules[rule](value, double.parse(parameter));
  }

}