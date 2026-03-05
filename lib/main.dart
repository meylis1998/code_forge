import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'core/dependency_injection/injection_container.dart';
import 'core/platform/macos_window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize HydratedBloc storage
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getApplicationDocumentsDirectory()).path,
    ),
  );

  // Initialize dependencies
  await initDependencies();

  // Configure macOS window
  await MacOSWindowManager.initialize();

  runApp(const CodeForgeApp());
}
