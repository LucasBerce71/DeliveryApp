
class DatabaseErrorException implements Exception {
  String message;
  Exception exception;
 
  DatabaseErrorException({
    this.message,
    this.exception,
  });
}
