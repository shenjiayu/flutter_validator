library flutter_validator;

import 'package:flutter_validator/validator_interface.dart';
import 'package:flutter_validator/simple_validator.dart';
import 'package:flutter_validator/number_validator.dart';
import 'package:flutter_validator/size_validator.dart';

class ValidatorDelegate {

  static final Map<String, Validator> delegates = {
    'required': new SimpleValidator(),
    'number': new SimpleValidator(),
    'min': new NumberParameterValidator(),
    'max': new NumberParameterValidator(),
    'equal': new NumberParameterValidator(),
    'size': new SizeValidator()
  };

  static List<String> isRuleWithNumberParameter(String ruleName) {
    if (RegExp("(min|max|equal|size):[1-9]\d*").hasMatch(ruleName)) {
      return ruleName.split(":");
    }
    return null;
  }

  static bool delegate(String ruleName, dynamic value) {
    List<String> t = isRuleWithNumberParameter(ruleName);
    if (t != null) {
      return delegates[t[0]].validate(t[0], value, t[1]);
    } else {
      return delegates[ruleName].validate(ruleName, value, null);
    }
  }

}