class ServerExceptions implements Exception {
  final String message;
  final String? code;
  const ServerExceptions({required this.message, this.code = ""});
}
