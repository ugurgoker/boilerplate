extension ExtensionBool on String? {

  bool isValidEmail() {
    String? value = this;
    if (value == null) {
      return false;
    }
    if(value.isNotEmpty) {
      String pattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
      RegExp regex = RegExp(pattern);
      return regex.hasMatch(value);
    } else {
      return false;
    }
  }

  bool isValidPhone() {
    String? value = this;
    if (value == null) {
      return false;
    }
    if(value.isNotEmpty) {
      String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
      RegExp regex = RegExp(pattern);
      return regex.hasMatch(value);
    } else {
      return false;
    }
  }

  bool isValidPassword() {
    String? value = this;
    if (value == null) {
      return false;
    }
    if(value.isNotEmpty) {
      String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])';
      RegExp regExp = RegExp(pattern);
      return regExp.hasMatch(value);
    } else {
      return false;
    }
  }

  bool isValidTCIdentityNumber() {
    if (this == null) {
      return false;
    }
    int identitiyNumber = int.parse(this!);
    if (identitiyNumber.toString().length == 11) {
      if (identitiyNumber.toString().substring(0, 1) != '0') {
        int top = 0;
        for (int i = 0; i < 10; i++) {
          String val = identitiyNumber.toString().substring(i, i + 1);
          top = top + int.parse(val);
        }
        top = top % 10;
        if (top == int.parse(identitiyNumber.toString().substring(10))) {
          return true;
        }
      }
    }
    return false;
  }

}
