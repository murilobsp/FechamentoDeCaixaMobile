// ignore: unused_import
import 'package:fechamento_caixa/features/cadastro/view/cadastro_screen.dart';
import 'package:fechamento_caixa/features/drawer/sobre_o_app_screen.dart';
import 'package:fechamento_caixa/features/exportar/view/exportar_screen.dart';
import 'package:fechamento_caixa/features/historico_de_caixas/view/historico_caixas_screen.dart';
import 'package:fechamento_caixa/features/login/view/login_screen.dart';
import 'package:fechamento_caixa/features/welcome/view/welcome_screen.dart';
import 'package:fechamento_caixa/features/home/view/home_screen.dart';
import 'package:fechamento_caixa/features/novo_fechamento/view/novo_fechamento_screen.dart';
import 'package:fechamento_caixa/features/relatorio_de_caixa/view/relatorio_caixa_screen.dart';
import 'package:fechamento_caixa/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      initialRoute: "/",

      routes: {
        
        "/": (context) => const WelcomeScreen(),
        "/login": (context) => const LoginScreen(),
        "/cadastro" :(context) => const CadastroScreen(),
        "/home": (context) => const HomeScreen(),
        "/novo_fechamento": (context) => const NovoFechamentoScreen(),
        "/historico_caixas": (context) => const HistoricoCaixasScreen(),
        "/relatorio_caixa":(context) => const RelatorioCaixaScreen(),
        "/exportar" :(context) => const ExportarScreen(),
        "/sobreoapp" :(context) => const SobreOAppScreen()

      },
    ),
  );
}
