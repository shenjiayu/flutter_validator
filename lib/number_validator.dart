import 'package:flutter_validator/validator_interface.dart';
import 'package:flutter_validator/utils/helpers.dart';

class NumberParameterValidator implements Validator {

  static final NumberParameterValidator _singleton = new NumberParameterValidator._internal();

  factory NumberParameterValidator() {
    return _singleton;
  }

  NumberParameterValidator._internal();

  Map<String, Function> _rules = {
    'min': (double value, double boundary) {
      if (value > boundary) return true;
      return false;
    },
    'max': (double value, double boundary) {
      if (value < boundary) return true;
      return false;
    },
    'equal': (double value, double boundary) {
      if (value == boundary) return true;
      return false;
    }
  };

  bool validate(String rule, dynamic value, String parameter) {
    if (isNumeric(value)) {
      return _rules[rule](double.parse(value), double.parse(parameter));
    }
    return false;
  }
  
}