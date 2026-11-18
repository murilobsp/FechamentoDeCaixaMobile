import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark
      ),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
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
          child: Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
      
              children: [
                Image.asset('assets/welcome/caixa.png', width: 300, height: 300,),
      
                SizedBox(height: 20,),
                
                Text("Seu caixa,", style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w800, height: 0.8),),
                Text("sob controle", style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w800),), 
      
                SizedBox(height: 30,),
      
                Text("   Organize seus fechamentos e", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400),), 
                Text("acompanhe suas movimentações", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400),), 
                Text("de forma simples e prática.", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400),), 
      
      
                SizedBox(height: 50,),
                
      
      
      
      
                Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 25),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/cadastro");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 18, 213),
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        "Começar agora",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
      
                SizedBox(height: 15),
      
                Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 25),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(15, 33, 149, 243),
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.white),
                      ),
                      child: Text(
                        "Já tenho uma conta",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
      
                SizedBox(height: 20),
      
                Text("Ao continuar, você concorda com os nossos Termos de Uso.", style: TextStyle(fontSize: 12, color: const Color.fromARGB(255, 190, 190, 190)),),
      
                
              ],
            ),
          ),
        ),
      
        
      ),
    );
  }
}
