(bool, dynamic) validateDouble({
  required String value,
  required bool isLimited,
  double limLower = 0,
  double limUpper = 300,
}) {
  var num = double.tryParse(value);
  //
  if (num == null) {
    return (false, "\t\tUm número no formato: 99.999\n");
  }
  //
  if (isLimited && (num < limLower || num > limUpper)) {
    return (false, "\t\tUm número entre $limLower e $limUpper\n");
  }
  //
  return (true, num);
}