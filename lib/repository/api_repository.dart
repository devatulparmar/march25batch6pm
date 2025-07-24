import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart' show DefaultHttpClientAdapter, IOHttpClientAdapter;
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  static Future getAPICall(String urlLink, Map<String, String>? headers) {
    return http.get(Uri.parse(urlLink), headers: headers);
  }

  static Future postAPICall(String urlLink, Map<String, String>? headers,
      Map<String, dynamic>? body) async {
    return http.post(Uri.parse(urlLink), headers: headers, body: body);
  }

  static Future postDioAPICallWithSendCertificates(String urlLink,
      Map<String, String>? headers, Map<String, dynamic>? body) async {
    // Load .p12 certificate file
    final ByteData certData = await rootBundle.load('assets/cert/client.p12');
    final Uint8List certBytes = certData.buffer.asUint8List();

    // Create security context and load client cert
    final securityContext = SecurityContext(withTrustedRoots: true)
      ..useCertificateChainBytes(certBytes, password: 'your_cert_password')
      ..usePrivateKeyBytes(certBytes, password: 'your_cert_password');

    // Create custom HttpClient using the context
    final customHttpClient = HttpClient(context: securityContext)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true; // ⚠️ DEV ONLY

    // Use the custom HttpClient with Dio
    final dio = Dio();
    final adapter = IOHttpClientAdapter()
      ..onHttpClientCreate = (client) => customHttpClient;

    dio.httpClientAdapter = adapter;
    return dio.post(urlLink, options: Options(headers: headers), data: body);
  }
}
