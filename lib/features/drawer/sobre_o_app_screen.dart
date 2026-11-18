import 'package:fechamento_caixa/features/bottom/bottom_navigator.dart';
import 'package:flutter/material.dart';

class SobreOAppScreen extends StatelessWidget {
  const SobreOAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          "Sobre o Aplicativo",
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 18, 213),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(),
                alignment: Alignment.topCenter,
                width: double.infinity,

                child: Column(
                  children: [
                    Container(
                      width: 90,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 18, 213),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        'assets/drawer/caixa-white.png',
                        width: 60,
                        height: 90,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Text(
                "Fechamento de Caixa",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),

              Divider(
                color: const Color.fromARGB(41, 158, 158, 158),
                thickness: 2,
                height: 30,
              ),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sobre o sistema",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Aplicativo desenvolvido para facilitar o gerenciamento e o fechamento diário de caixa,"
                      "permitindo registrar diferentes formas de pagamento,"
                      "consultar históricos e gerar relatórios em PDF.",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),

                    SizedBox(height: 30),

                    Text(
                      "Funcionalidades",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text("• Abertura e Fechamento de caixa",style: TextStyle(fontWeight: FontWeight.w500),),

                    Text("• Histórico de fechamentos",style: TextStyle(fontWeight: FontWeight.w500),),

                    Text("• Exportação de relatórios em PDF",style: TextStyle(fontWeight: FontWeight.w500),),

                    Text("• Gerenciamento de usuários",style: TextStyle(fontWeight: FontWeight.w500),),

                    SizedBox(height: 30,),

                    Text(
                      "Desenvolvedor",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),

                    SizedBox(height: 20),

                    Row(
                      spacing: 15,
                      children: [
                        Image.asset('assets/drawer/html.png', width: 70,),

                        

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("Murilo Bispo",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),

                            Text("Software engineer", style: TextStyle(fontWeight: FontWeight.w500),),
                            Text("murilobsp99@gmail.com",style: TextStyle(fontWeight: FontWeight.w500),),

                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(child: BottomNavigator()),
    );
  }
}
