bool validateEmail(String value) {
  if (value.isEmpty) {
    return false;
  } else {
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    return emailRegex.hasMatch(value);
  }
}
