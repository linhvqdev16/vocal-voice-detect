import 'package:flutter/cupertino.dart';

class NavigatorService{

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  void pop(BuildContext context){
     FocusScope.of(context).unfocus();
     return navigatorKey.currentState!.pop();
  }

  Future<dynamic> pushNamed(String routeName, {dynamic arguments}){
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushAndRemoveUntil(Route route, {dynamic arguments}){
    return navigatorKey.currentState!.pushAndRemoveUntil(route, (Route<dynamic> route) => false);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {dynamic arguments}){
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, (_) => false, arguments: arguments);
  }
}