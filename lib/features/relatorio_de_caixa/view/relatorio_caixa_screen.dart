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
                color: Colors.amber,
              ),
              child: Text("DATAAAAA"),
            )
          ],
          
          
          
        ),
      ),
    );
  }
}
