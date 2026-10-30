import 'package:fechamento_caixa/features/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

bool selectInicio = false;
bool selectCaixa = false;
bool selectRelatorios = false;
bool selectMais = false;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formatoDinheiro = NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
  final HomeViewmodel homeViewmodel = HomeViewmodel();
  double inicioCaixa = 0;

  Future<void> buscarInicio() async {
    final valor = await homeViewmodel.buscarInicio();

    setState(() {
      inicioCaixa = valor;
    });
  }

  @override
  void initState() {
    super.initState();
    buscarInicio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          "Inicio",
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 18, 213),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 18, 213),
              ),
              child: Column(
                children: [
                  SizedBox(height: 70),

                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: InkWell(
                      onTap: () {},

                      customBorder: const CircleBorder(),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          'assets/drawer/fotoPerfil.png',
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "Murilo Bispo",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,

                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 25,
                          children: [
                            Image.asset('assets/drawer/user.png', width: 25),
                            Text(
                              "Meu Perfil",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(200, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),

                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,

                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 25,
                          children: [
                            Image.asset(
                              'assets/drawer/aparencia.png',
                              width: 25,
                            ),
                            Text(
                              "Aparência",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(200, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),

                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,

                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 25,
                          children: [
                            Image.asset('assets/drawer/config.png', width: 27),
                            Text(
                              "Configurações",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(200, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),

                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,

                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 25,
                          children: [
                            Image.asset('assets/drawer/ajuda.png', width: 23),
                            Text(
                              "Ajuda e Suporte",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(200, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),

                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 18),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,

                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 18,
                          children: [
                            Image.asset('assets/drawer/info.png', width: 32),
                            Text(
                              "Sobre o aplicativo",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(200, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),

                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Divider(
              color: const Color.fromARGB(41, 158, 158, 158),
              thickness: 2,
              height: 40,
              indent: 28,
              endIndent: 28,
              
            ),

            SizedBox(height: 13,),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(25, 255, 0, 0),

                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 18,
                          children: [
                            Image.asset('assets/drawer/sair.png', width: 32),
                            Text(
                              "Sair da Conta",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(199, 255, 0, 0),
                              ),
                            ),
                          ],
                        ),

                        Icon(Icons.arrow_forward_ios_rounded, color: const Color.fromARGB(255, 255, 0, 0),),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 50,),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: Text("Versão 1.0.0"),
              ),
            ),


          ],
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 5),
              //BOX CAIXA ATUAL
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 18, 213),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),

                //VALORES INTERNO
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Inicio do caixa",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        Text(
                          "Aberto",
                          style: TextStyle(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 8, 233, 1),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        formatoDinheiro.format(inicioCaixa),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Dia do Caixa: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),

                    Text(
                      "Operador: Murilo",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/novo_fechamento");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(15),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/home_screen/novo_fechamento.png',
                                width: 50,
                                height: 50,
                              ),

                              Text(
                                "Novo",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Fechamento",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/historico_caixas");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(15),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/home_screen/historico_relatorios.png',
                                width: 50,
                                height: 50,
                              ),

                              Text(
                                "Histórico",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),

                              Text(
                                "de Caixas",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/relatorio_caixa");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(15),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/home_screen/relatorios.png',
                                width: 50,
                                height: 50,
                              ),

                              Text(
                                "Relatórios",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(15),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/home_screen/usuario.png',
                                width: 50,
                                height: 50,
                              ),

                              Text("Usuários"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          height: 50,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectInicio
                      ? Colors.white
                      : const Color.fromARGB(255, 0, 18, 213),
                  foregroundColor: selectInicio ? Colors.white : Colors.black,
                  fixedSize: Size(70, 50),
                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      selectInicio
                          ? 'assets/home_screen/botao-de-inicio.png'
                          : 'assets/home_screen/botao-de-inicio-white.png',

                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, "/novo_fechamento");
                  setState(() {
                    selectInicio = false;
                    selectCaixa = !selectCaixa;
                    selectRelatorios = false;
                    selectMais = false;
                  });

                  setState(() {
                    selectInicio = false;
                    selectCaixa = false;
                    selectRelatorios = false;
                    selectMais = false;
                  });
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: selectCaixa
                      ? const Color.fromARGB(255, 0, 18, 213)
                      : Colors.white,
                  foregroundColor: selectCaixa ? Colors.white : Colors.black,
                  fixedSize: Size(70, 50),
                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      selectCaixa
                          ? 'assets/home_screen/caixa-registradora-white.png'
                          : 'assets/home_screen/caixa-registradora.png',
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, "/historico_caixas");
                  setState(() {
                    selectInicio = false;
                    selectCaixa = false;
                    selectRelatorios = !selectRelatorios;
                    selectMais = false;
                  });

                  setState(() {
                    selectInicio = false;
                    selectCaixa = false;
                    selectRelatorios = false;
                    selectMais = false;
                  });
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: selectRelatorios
                      ? const Color.fromARGB(255, 0, 18, 213)
                      : Colors.white,
                  foregroundColor: selectRelatorios
                      ? Colors.white
                      : Colors.black,
                  fixedSize: Size(70, 50),
                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      selectRelatorios
                          ? 'assets/home_screen/relatorio-white.png'
                          : 'assets/home_screen/relatorio.png',
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectInicio = false;
                    selectCaixa = false;
                    selectRelatorios = false;
                    selectMais = !selectMais;
                  });
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: selectMais
                      ? const Color.fromARGB(255, 0, 18, 213)
                      : Colors.white,
                  foregroundColor: selectMais ? Colors.white : Colors.black,
                  fixedSize: Size(70, 50),
                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      selectMais
                          ? 'assets/home_screen/mais-white.png'
                          : 'assets/home_screen/mais.png',
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
