bool verifyNumber(String value){
  return RegExp(r'^(?:[0-9]\d*|0)?(?:\.\d+)?$').hasMatch(value);
}

bool isNumeric(dynamic str) {
  if(str == null) {
    return false;
  }
  return double.tryParse(str.toString()) != null;
}