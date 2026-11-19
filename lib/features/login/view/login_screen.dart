import 'package:fechamento_caixa/features/login/model/login_model.dart';
import 'package:fechamento_caixa/features/login/viewmodel/login_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool mostrarSenha = false;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  final LoginViewmodel viewmodel = LoginViewmodel();

  bool carregando = false;

  Future<void> entrar() async {
    setState(() {
      carregando = true;
    });

    try {
      LoginModel login = LoginModel(
        email: emailController.text,
        senha: senhaController.text,
      );

      await viewmodel.fazerLogin(login);

      if (!mounted) return;

      Navigator.pushNamed(context, "/home");
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      String mensagem = "Erro ao fazer login.";

      if (e.code == "invalid-email") {
        mensagem = "E-mail invalido.";
      } else if (e.code == "invalid-credential" ||
          e.code == "wrong-password" ||
          e.code == "user-not-found") {
        mensagem = "E-mail ou senha incorretos.";
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(mensagem)));
    } finally {
      setState(() {
        carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          width: double.infinity,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF061A35),
                Color(0xFF0B326B),
                Color(0xFF1557A6),
                Color(0xFF2074C9),
              ],
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),

              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            SizedBox(height: 50),

                            SizedBox(
                              width: double.infinity,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Text(
                                    "Bem-vindo de volta",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  ),

                                  SizedBox(height: 3),

                                  Text("Entre com seus dados para"),
                                  Text("acessar sua conta"),
                                ],
                              ),
                            ),

                            SizedBox(height: 30),

                            Row(
                              children: [
                                //Icon(Icons.email_outlined),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "    E-mail",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      SizedBox(
                                        width: double.infinity,
                                        height: 60,
                                        child: TextField(
                                          controller: emailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            hintText: "Digite seu e-mail",
                                            prefixIcon: Icon(
                                              Icons.email_outlined,
                                            ),

                                            filled: true,
                                            fillColor: const Color.fromARGB(
                                              34,
                                              158,
                                              158,
                                              158,
                                            ),

                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: const Color.fromARGB(
                                                  34,
                                                  158,
                                                  158,
                                                  158,
                                                ),
                                              ),
                                            ),

                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10),

                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "    Senha",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      SizedBox(
                                        width: double.infinity,
                                        height: 60,
                                        child: TextField(
                                          controller: senhaController,
                                          obscureText: !mostrarSenha,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          decoration: InputDecoration(
                                            hintText: "Digite sua senha",
                                            prefixIcon: !mostrarSenha
                                                ? Icon(Icons.lock_outline)
                                                : Icon(
                                                    Icons.lock_open_outlined,
                                                  ),

                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  mostrarSenha = !mostrarSenha;
                                                });
                                              },

                                              icon: Icon(
                                                mostrarSenha
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                          .visibility_off_outlined,
                                              ),
                                            ),

                                            filled: true,
                                            fillColor: const Color.fromARGB(
                                              34,
                                              158,
                                              158,
                                              158,
                                            ),

                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: const Color.fromARGB(
                                                  34,
                                                  158,
                                                  158,
                                                  158,
                                                ),
                                              ),
                                            ),

                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 15),

                            SizedBox(
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Esqueci minha senha",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      0,
                                      18,
                                      213,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 20),

                            SizedBox(
                              width: double.infinity,
                              height: 50,

                              child: ElevatedButton(
                                onPressed: carregando ? null : entrar,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                    164,
                                    0,
                                    0,
                                    0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      30,
                                    ),
                                  ),
                                  foregroundColor: Colors.white,
                                ),
                                child: carregando ? const CircularProgressIndicator() : const Text(
                                  "Entrar",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 15),

                            Row(
                              spacing: 5,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Ainda não tem uma conta?"),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/cadastro");
                                  },
                                  child: Text(
                                    "Cadastre-se",
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                        255,
                                        0,
                                        18,
                                        213,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: -16,
                    child: Image.asset(
                      'assets/login/cracha.png',
                      width: 130,
                      height: 130,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
