import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:window_manager/window_manager.dart';

import '../constants/app_constants.dart';

class MacOSWindowManager {
  const MacOSWindowManager._();

  static Future<void> initialize() async {
    if (!defaultTargetPlatform.toString().contains('macOS')) return;

    await windowManager.ensureInitialized();

    final windowOptions = WindowOptions(
      size: const Size(
        AppConstants.defaultWindowWidth,
        AppConstants.defaultWindowHeight,
      ),
      minimumSize: const Size(
        AppConstants.minWindowWidth,
        AppConstants.minWindowHeight,
      ),
      center: true,
      backgroundColor: const Color(0xFF1A1A2E),
      titleBarStyle: TitleBarStyle.hidden,
      title: AppConstants.appName,
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
