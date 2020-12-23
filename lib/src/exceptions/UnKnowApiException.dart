class UnKnowApiException implements Exception{
  int httpCode;

  UnKnowApiException(this.httpCode);
}