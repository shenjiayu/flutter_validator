import 'package:flutter_validator/validator_interface.dart';
import 'package:flutter_validator/utils/helpers.dart';

class SimpleValidator implements Validator {

  static final SimpleValidator _singleton = new SimpleValidator._internal();

  factory SimpleValidator() {
    return _singleton;
  }

  SimpleValidator._internal();

  Map<String, Function> _rules = {
    'required': (dynamic value) {
      if (value.isEmpty) return false;
      return true;
    },
    'number': (dynamic value) {
      if (isNumeric(value)) return true;
      return false;
    }
  };

  bool validate(String rule, dynamic value, String parameter) {
    return _rules[rule](value);
  }

}