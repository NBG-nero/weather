double checkDouble(dynamic value) {
  if (value == int) {
    // return value.toDouble();
    double ad = value.toDouble();
    return ad.toDouble();
  }
  return value;
}
