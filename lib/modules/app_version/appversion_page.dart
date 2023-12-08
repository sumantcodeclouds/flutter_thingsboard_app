import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:package_info/package_info.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class AppVersionPage extends TbPageWidget {
  AppVersionPage(TbContext tbContext) : super(tbContext);

  @override
  _AssetsPageState createState() => _AssetsPageState();
}

class _AssetsPageState extends TbPageState<AppVersionPage> {
  final PageLinkController _pageLinkController = PageLinkController();
  var appDetail = '';
  getDeviceDetail() async {
    String udid = await FlutterUdid.udid;
    // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    // final deviceInfo1 = await deviceInfo.deviceInfo;
    // final allInfo = deviceInfo1.data;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    print(packageInfo.version);
    print('packahe info');
    setState(() {
      appDetail = packageInfo.version;
    });
    // print(allInfo);
    print('device info');
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar;
    appBar = TbAppBar(tbContext, title: Text('App details'));
    return Scaffold(
      appBar: appBar,
      body: Container(
        // width: 200.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            // 'App version :' + appDetail['version']['release'],
            'App version: ' + appDetail,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    getDeviceDetail();
    super.initState();
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }
}
