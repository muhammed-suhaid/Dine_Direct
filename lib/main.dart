import 'package:dine_direct/services/auth/auth_gate.dart';
import 'package:dine_direct/firebase_options.dart';
import 'package:dine_direct/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Dine Direct',
      theme: ref.watch(themeProvider).themeData,
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
    );
  }
}
