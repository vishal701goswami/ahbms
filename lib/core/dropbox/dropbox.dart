import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dropbox_client/dropbox_client.dart';
import 'package:external_path/external_path.dart';

import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class DropBoxtoken {
  static String token =
      "sl.BX5QDD5sxROZixH3XxF2xMKYWK6z1n54NQKq25MIAgY5E33LvLjS49SXCDHEBZ0u3J2Lk2mKrj3BwhXUjQY45DbJft2l5rVbtlOkg4aDFxmSV1kYOg0lNcA07_790xaDBYs9unwBbCvt";
  static String refreshToken =
      "xCJUkF6DTWgAAAAAAAAAASEpy2FUuE4k8mCY7ZPrMpJ6iA9Y0AyAyNjYsf3f99qS";
  String apiToken = token;
}

class MyDropBox {
  final String clientId;
  final String appKey;
  final String appSecret;
  static String? accessToken;

  MyDropBox(this.clientId, this.appKey, this.appSecret);
  Future initDropbox() async {
    // init dropbox client. (call only once!)
    await Dropbox.init(clientId, appKey, appSecret);
  }

  static Future login() async {
    await Dropbox.authorize();
  }

  static Future getAccessToken() async {
    accessToken = await Dropbox.getAccessToken();
    if (accessToken != null) {
      DropBoxtoken.token = accessToken!;
    }
  }

  static Future loginWithAccessToken() async {
    await Dropbox.authorizeWithAccessToken(accessToken!);
  }
  
}


