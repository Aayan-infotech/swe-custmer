class Validator {
  // Validate first name (non-empty and only alphabetic characters)
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'First name cannot be empty';
    }
    if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
      return 'First name should only contain alphabets';
    }
    return null;
  }

  // Validate last name (non-empty and only alphabetic characters)
  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Last name cannot be empty';
    }
    if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
      return 'Last name should only contain alphabets';
    }
    return null;
  }

  // Validate email format
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // Using a basic regex for email validation
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Validate mobile number (USA format)
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number cannot be empty';
    }

    // Remove formatting characters like "(", ")", " ", "-" and check the number
    String digitsOnly = value.replaceAll(RegExp(r'\D'), '');

    // Ensure that the number starts with "1" (from the "+1" part) and has exactly 11 digits
    if (!digitsOnly.startsWith('1') || digitsOnly.length != 11) {
      return 'Please enter a valid phone number';
    }

    // Additional validation for area code and exchange code (optional)
    String areaCode = digitsOnly.substring(1, 4);  // Digits after the "+1"
    String exchangeCode = digitsOnly.substring(4, 7);

    // Area code should be valid and exchange code should not start with "11"
    if (RegExp(r'^[2-9]\d{2}$').hasMatch(areaCode) && RegExp(r'^[2-9]\d{2}$').hasMatch(exchangeCode)) {
      return null;  // Valid number
    } else {
      return 'Please enter a valid phone number';
    }
  }


  // Validate the "Referred by" field (optional, so can be empty or non-empty)
  static String? validateReferredBy(String? value) {
    if (value != null && value.isNotEmpty) {
      if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
        return 'Referred by should only contain alphabets and spaces';
      }
    }
    return null;
  }
  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP cannot be empty';
    }
    if (value.length != 4) {
      return 'OTP must be exactly 4 digits';
    }
    if (!RegExp(r'^[0-9]{4}$').hasMatch(value)) {
      return 'OTP must contain only digits';
    }
    return null; // OTP is valid
  }

  static String? validateField(String? value, String? msg) {
    if (value != null && value.trim().isNotEmpty) {
      return null; // No error, validation passed
    } else {
      return msg ?? "Field can't be empty";
    }
  }


 static String? validatePassword(String? value) {
    if (value == null) {
      return null;
    } else if (value.isEmpty) {
      return "Please enter password!";
    } else if (value.length < 6){
      return "Password must be min six digits!";
    } else{
      return null;
    }
  }




  String? validateOldPassword(String? value) {
    if (value == null) {
      return null;
    } else if (value.isEmpty) {
      return "Please enter old password!";
    } else {
      return null;
    }
  }

 static String? validateConfirmPassword(String? value, String password) {
    if (value == null) {
      return null;
    } else if (value.isEmpty) {
      return "Please enter confirm password!";
    }  else if (value!=password) {
      return "New and confirm password must be same!";
    }else {
      return null;
    }
  }


}
