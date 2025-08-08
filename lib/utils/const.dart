import 'dart:ui';

import 'package:flutter/cupertino.dart';

GlobalKey<NavigatorState> mainKey = GlobalKey<NavigatorState>();

const String imgBirdImage = "images/img1.jpeg";
const String prefLogin = "isLogin";
const String prefGoogleLogin = "isGoogleLogin";
const String prefLoginToken = "prefLoginToken";

const int successStatusCode = 200;
const int unauthorizedStatusCode = 401;
const int internalServerErrorCode = 500;
