class DefaultApiError {
  final String message;

  DefaultApiError({required this.message});

  // Ensure it parses the root-level JSON fields
  factory DefaultApiError.fromJson(Map<String, dynamic> json) {
    return DefaultApiError(
      message: json['message'] ?? 'Unknown error',
    );
  }
}
