import 'package:dependency_injection/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dependencies.dart';
import 'myapp.dart';

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configureDependencies(DependencyConfigurationContext());
  runApp(const ProviderScope(child: MyApp()));
}
