import 'dart:io';

import 'package:camarate_school_library/Models/view_models/conetividade.dart';
import 'package:camarate_school_library/screens/menu_lateral/menu_lateral.dart';
import 'package:camarate_school_library/screens/splash_screen.dart';
import 'package:camarate_school_library/services/auth_services.dart';
import 'package:camarate_school_library/models/view_models/livro_requisitado_view_model.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Conectividade()),
        ChangeNotifierProvider(create: (_) => LivroRequisitadoModel()),
        ChangeNotifierProvider(create: (_) => AuthServices()),
      ],
      child: const BashiriSchoolLibraryApp(),
    ),
  );
  HttpOverrides.global = MyHttpOverrides();
}

class BashiriSchoolLibraryApp extends StatelessWidget {
  const BashiriSchoolLibraryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AutenticarUtilizador(),
    );
  }
}

class AutenticarUtilizador extends StatelessWidget {
  const AutenticarUtilizador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthServices autenticacao = Provider.of<AuthServices>(context);

    if (autenticacao.isLoading) {
      return aCarregarPagina();
    } else if (autenticacao.utilizador == null) {
      return const IniciarApp();
    } else {
      return const MenuLateral();
    }
  }

  aCarregarPagina() {
    return Scaffold(
      body: Center(
        child: Platform.isAndroid
            ? const CircularProgressIndicator()
            : const CupertinoActivityIndicator(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
