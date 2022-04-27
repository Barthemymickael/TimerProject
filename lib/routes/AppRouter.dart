import 'package:flutter/material.dart';

class AppRouter{

 static Map<String, WidgetBuilder>_routes =<String, WidgetBuilder> {};

  static getRoutes()=>_routes;

}