import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitacheck/provider/Database/db_provider.dart';
import 'package:vitacheck/provider/sensor_provider.dart';
import 'package:vitacheck/provider/auth/auth_provider.dart';
import 'package:vitacheck/responsive/Responsive.dart';
import 'package:vitacheck/responsive/desktop_view.dart';
import 'package:vitacheck/responsive/mobile_view.dart';

import 'provider/messaging_provider.dart';


void main() async {
  return runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Authentication()),
        ChangeNotifierProvider(create: (_) => DatabaseProvider()),
        ChangeNotifierProvider(create: (_) => SensorDataApi()),
        ChangeNotifierProvider(create: (_) => MessagingDataApi()),
        ChangeNotifierProvider(create: (_) =>ReplyDataApi()),
        
        StreamProvider<Map>(
            create: (_) => SensorDataApi().initStream(), initialData: {}),
         
        StreamProvider<Map>(
            create: (_) => MessagingDataApi().initChat(), initialData: {})
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: responsive(Mobile: mobileView(),Desktop: desktopView(),),
      )));
}

