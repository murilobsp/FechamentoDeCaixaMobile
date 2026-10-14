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
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400),
        ),
      ),

      body: Padding(
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
                        Icon(Icons.calendar_month_outlined),
                        SizedBox(width: 10,),
                        Text("25/09/2026",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
                      ],
                    ),
                
                    Row(
                      children: [                      
                        Icon(Icons.access_time_rounded),
                        SizedBox(width: 10,),
                        Text("17:32:28", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
                      ],
                    ),


                    Row(
                      children: [
                        Icon(Icons.person_outline),
                        SizedBox(width: 10,),
                        Text("Murilo", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
                      ],
                    ),
                    
                  ],
                ),
              ),
            ),

            //AFASTA OS DOIS CONTAINERS
            SizedBox(height: 20,),



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
                    Text("Resumo por forma de pagamento", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                    
                    SizedBox(height: 15,),

                    Row(
                      children: [
                        
                        Icon(Icons.money),
                        SizedBox(width: 10,),
                        Text("25/09/2026",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
                      ],
                    ),
                
                    Row(
                      children: [
                        
                        Icon(Icons.access_time_rounded),
                        SizedBox(width: 10,),
                        Text("17:32:28", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
                      ],
                    ),


                    Row(
                      children: [
                        
                        Icon(Icons.person_outline),
                        SizedBox(width: 10,),
                        Text("Murilo", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
                      ],
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
          
          
          
        ),
      ),
    );
  }
}
