import 'package:flutter/material.dart';

bool selectInicio = false;
bool selectCaixa = false;
bool selectRelatorios = false;
bool selectPdf = false;

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          ElevatedButton(
            onPressed: () async{
              
              setState(() {
                selectInicio = true;
                selectCaixa = false;
                selectRelatorios = false;
                selectPdf = false;
              });

              await Navigator.pushNamed(context, "/");

              setState(() {
                selectInicio = false;
                selectCaixa = false;
                selectRelatorios = false;
                selectPdf = false;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: selectInicio
                  ? const Color.fromARGB(255, 0, 18, 213)
                  : Colors.white,
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
                      ? 'assets/home_screen/botao-de-inicio-white.png'
                      : 'assets/home_screen/botao-de-inicio.png',

                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () async {
              
              setState(() {
                selectInicio = false;
                selectCaixa = true;
                selectRelatorios = false;
                selectPdf = false;
              });

              await Navigator.pushNamed(context, "/novo_fechamento");

              setState(() {
                selectInicio = false;
                selectCaixa = false;
                selectRelatorios = false;
                selectPdf = false;
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
              
              setState(() {
                selectInicio = false;
                selectCaixa = false;
                selectRelatorios = true;
                selectPdf = false;
              });

              await Navigator.pushNamed(context, "/historico_caixas");

              setState(() {
                selectInicio = false;
                selectCaixa = false;
                selectRelatorios = false;
                selectPdf = false;
              });
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: selectRelatorios
                  ? const Color.fromARGB(255, 0, 18, 213)
                  : Colors.white,
              foregroundColor: selectRelatorios ? Colors.white : Colors.black,
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
            onPressed: () async {
              
              setState(() {
                selectInicio = false;
                selectCaixa = false;
                selectRelatorios = false;
                selectPdf = true;
              });

              await Navigator.pushNamed(context, "/exportar");

              setState(() {
                selectInicio = false;
                selectCaixa = false;
                selectRelatorios = false;
                selectPdf = false;
              });
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: selectPdf
                  ? const Color.fromARGB(255, 0, 18, 213)
                  : Colors.white,
              foregroundColor: selectPdf ? Colors.white : Colors.black,
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
                  selectPdf
                      ? 'assets/home_screen/pdf-white.png'
                      : 'assets/home_screen/pdf.png',
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
