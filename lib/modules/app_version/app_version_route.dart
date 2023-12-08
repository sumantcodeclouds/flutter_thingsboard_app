import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/routes/router.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/modules/app_version/appversion_page.dart';

class AppVersionRoutes extends TbRoutes {
  late var assetsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return AppVersionPage(tbContext);
  });

  AppVersionRoutes(TbContext tbContext) : super(tbContext);

  @override
  void doRegisterRoutes(router) {
    router.define("/appversion", handler: assetsHandler);
  }
}
