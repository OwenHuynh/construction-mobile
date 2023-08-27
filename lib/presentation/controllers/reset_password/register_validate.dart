import 'package:construction_mobile/utils/validation/validate_util.dart';
import 'package:construction_mobile/utils/validation/validation_result.dart';

class RegisterValidationResults {
  static ValidationResult validateID(String id) {
    if (ValidateUtil.isNullEmptyOrWhitespace(id)) {
      return ValidationResult.error("This field is required!");
      // } else if (!ValidateUtil.validateEmail(email)) {
      //   return ValidationResult.error("");
    }
    return ValidationResult.ok();
  }

  static ValidationResult validatePassword(String password) {
    if (ValidateUtil.isNullEmptyOrWhitespace(password)) {
      return ValidationResult.error("This field is required!");
    }
    if (password.length < 6) {
      return ValidationResult.error(
          "This field requires 6 characters or more!");
    }
    return ValidationResult.ok();
  }
}
