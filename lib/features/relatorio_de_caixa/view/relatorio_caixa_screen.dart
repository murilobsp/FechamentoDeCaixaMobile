import 'package:flutter/material.dart';

class RelatorioCaixaScreen extends StatelessWidget {
  const RelatorioCaixaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 18, 213),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Relatório do Caixa",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
        
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
        
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_month_outlined,
                          color: const Color.fromARGB(255, 0, 18, 213),),
                          SizedBox(width: 10),
                          Text(
                            "25/09/2026",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
        
                      SizedBox(height: 5,),
        
                      Row(
                        children: [
                          Icon(Icons.access_time_rounded,
                         color: const Color.fromARGB(255, 0, 18, 213),),
                          SizedBox(width: 10),
                          Text(
                            "17:32:28",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
        
                      Row(
                        children: [
                          Icon(Icons.person_outline,
                          color: const Color.fromARGB(255, 0, 18, 213),),
                          SizedBox(width: 10),
                          Text(
                            "Murilo",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        
              //AFASTA OS DOIS CONTAINERS
              SizedBox(height: 20),
        
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
        
                    children: [
                      Text(
                        "Resumo por forma de pagamento",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
        
                      SizedBox(height: 15),
        
                      Row(
                        children: [
                          Image.asset(
                            'assets/relatorio_caixa/dinheiro.png',
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Dinheiro",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
        
                      Divider(
                        color: const Color.fromARGB(41, 158, 158, 158),
                        thickness: 2,
                        height: 10,
                      ),
        
                      Row(
                        children: [
                          Image.asset(
                            'assets/relatorio_caixa/cartaocredito.png',
                            width: 45,
                            height: 45,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Crédito",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
        
                      Divider(
                        color: const Color.fromARGB(41, 158, 158, 158),
                        thickness: 2,
                        height: 10,
                      ),
        
                      Row(
                        children: [
                          Image.asset(
                            'assets/relatorio_caixa/cartaodebito.png',
                            width: 45,
                            height: 45,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Débito",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
        
                      Divider(
                        color: const Color.fromARGB(41, 158, 158, 158),
                        thickness: 2,
                        height: 10,
                      ),
        
                      Row(
                        children: [
                          Icon(Icons.pix, color: Colors.grey, size: 45),
        
                          SizedBox(width: 10),
                          Text(
                            "Pix",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
        
                      SizedBox(height: 20),
        
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(116, 158, 158, 158),
                          borderRadius: BorderRadius.circular(10),
                        ),
        
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total de vendas:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
        
                              Text(
                                "R\$ 1.323,00",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //AFASTA OS DOIS CONTAINERS
              SizedBox(height: 20),
        
        
        
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
        
                    children: [
                      Text(
                        "Movimentações",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
        
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/relatorio_caixa/entrada.png',
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Entradas",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
        
                      SizedBox(height: 5,),
        
                      Row(
                        children: [
                          Image.asset(
                            'assets/relatorio_caixa/saida.png',
                            //#CF0000 COR DA IMG
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Saidas",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
        
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
