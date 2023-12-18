

import 'colors.dart';

class Utils {
  //validators
  static String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return "Phone number required";
    }
    if (!RegExp(phonePattern).hasMatch(value)) {
      return "Please use format (+44 7234 123456)";
    }
    return null;
  }

  static String? pointOfContactValidator(String? value) {
    if (value!.isEmpty) {
      return "Point of contact required";
    }
    return null;
  }

  static String? businessNameValidator(String? value) {
    if (value!.isEmpty) {
      return "Business name required";
    }
    return null;
  }

  static String? businessLocationValidator(String? value) {
    if (value!.isEmpty) {
      return "Business Location required";
    }
    return null;
  }

  static String? addressValidator(String? value) {
    if (value!.isEmpty) {
      return "Address is required";
    }
    return null;
  }

  static String? dateOfBirthValidator(String? value) {
    if (value!.isEmpty) {
      return "Date of birth is required";
    }
    return null;
  }

  static String? licenseNumberValidator(String? value) {
    if (value!.isEmpty) {
      return "License number is required";
    }
    return null;
  }

  static String? licenseExpiryValidator(String? value) {
    if (value!.isEmpty) {
      return "License expiry date is required";
    }
    return null;
  }

  static String? vehiclePlateNumberValidator(String? value) {
    if (value!.isEmpty) {
      return "Vehicle plate number is required";
    }
    return null;
  }

  static String? fareValidator(String? value) {
    if (value!.isEmpty) {
      return "Rate required";
    }
    if (int.parse(value) == 0) {
      return "Rate can not be 0";
    }

    return null;
  }
  static String? moqValidator(String? value) {
    if (value!.isEmpty) {
      return "Minimum Order Quantity required";
    }
    if (int.parse(value) == 0) {
      return "Minimum Order Quantity can not be 0";
    }

    return null;
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "Email required";
    } else if (!RegExp(emailPatter).hasMatch(value)) {
      return "Enter a valid email";
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Password required";
    } else if (value.length < 8) {
      return "Minimum 8 character required in password";
    } else {
      return null;
    }
  }
  static String? otpValidator(String? value) {
    if (value!.isEmpty) {
      return "Otp required";

    }    else if (value.length < 4 ) {
      return "Minimum 4 character required in Otp";
    }else if (value.length > 4 ) {
      return "Minimum 4 character required in Otp";
    } else {
      return null;
    }
  }

  static String? userNameValidator(String? value) {
    if (value!.isEmpty) {
      return "User name required";
    } else {
      return null;
    }
  }
  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return "Name required";
    } else {
      return null;
    }
  }
  static String? simpleValidator(String? value) {
    if (value!.isEmpty) {
      return "Field is required";
    }
    return null;
  }
}
