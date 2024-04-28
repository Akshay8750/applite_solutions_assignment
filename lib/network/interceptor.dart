import 'package:pretty_dio_logger/pretty_dio_logger.dart';

var logInterceptor = PrettyDioLogger(
    requestHeader: true, requestBody: true, responseBody: true, responseHeader: false);
