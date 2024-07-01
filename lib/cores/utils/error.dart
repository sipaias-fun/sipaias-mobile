String? getErrorText(Map<String, String> validationErrors, String fieldName) {
  if (validationErrors.containsKey(fieldName) &&
      validationErrors[fieldName]!.isNotEmpty) {
    return validationErrors[fieldName];
  }
  return null;
}
