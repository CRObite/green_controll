
String? validateRequired(String value) {
  if (value.isEmpty || value == '') {
    return 'All fields must be filled in';
  }
  return null;
}

String? validateEmail(String email) {
  if (email.isEmpty || email.trim() == '') {
    return 'Email address is required';
  }

  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegExp.hasMatch(email)) {
    return 'Please enter a valid email address';
  }

  return null;
}

String? validateRequiredFields(List<String> values) {
  for (String value in values) {
    if (value.isEmpty || value.trim() == '') {
      return 'All fields must be filled in';
    }
  }

  return null;
}