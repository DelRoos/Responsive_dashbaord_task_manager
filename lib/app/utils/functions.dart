String getInitials({required String string, int limitTo = 1}) {
  var buffer = StringBuffer();
  var split = string.split(' ');
  for (var i = 0; i < (limitTo); i++) {
    buffer.write(split[i][0]);
  }

  return buffer.toString();
}
