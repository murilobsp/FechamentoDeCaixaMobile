import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fechamento_caixa/features/bottom/bottom_navigator.dart';
import 'package:fechamento_caixa/features/exportar/viewmodel/exportar_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:fechamento_caixa/features/novo_fechamento/view/novo_fechamento_screen.dart';
import 'package:intl/intl.dart';
import 'package:fechamento_caixa/features/exportar/service/pdf_download.dart';

bool selectTodos = false;
bool selectFechados = false;
bool selectMes = false;
bool selectPeriodo = false;
bool selectPdf = false;

DateTime? dataInicio;
DateTime? dataFim;

//REFERENCIA O VIEWMODELS PARA USAR A FUNCAO
final ExportarViewmodels viewmodels = ExportarViewmodels();

class ExportarScreen extends StatefulWidget {
  const ExportarScreen({super.key});

  @override
  State<ExportarScreen> createState() => _ExportarScreenState();
}

class _ExportarScreenState extends State<ExportarScreen> {
  Future<List<Map<String, dynamic>>>? resultadoPeriodo;

  Future<List<Map<String, dynamic>>> buscarNaVM() {
    if (selectTodos == true) {
      return viewmodels.buscarFechamentos();
    } else if (selectMes == true) {
      return viewmodels.buscaporMes(DateTime.now());
    } else if (selectPeriodo == true && resultadoPeriodo != null) {
      return resultadoPeriodo!;
    }

    return Future.value([]);
  }
  
  Future<void> selecData() async {
    
    final data = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now() ,
    );

    if (data == null) return;

    if (!mounted) return;

    setState(() {
      selectPeriodo = true;
      selectTodos = false;
      selectFechados = false;
      selectMes = false;

      resultadoPeriodo = viewmodels.buscaPeriodo(data.start, data.end);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Exportar PDF",
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 18, 213),
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectTodos = !selectTodos;
                          selectFechados = false;
                          selectMes = false;
                          selectPeriodo = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectTodos
                            ? const Color.fromARGB(255, 0, 18, 213)
                            : Colors.white,
                        foregroundColor: selectTodos
                            ? Colors.white
                            : const Color.fromARGB(255, 151, 151, 151),
                      ),
                      child: Text("Todos"),
                    ),

                    SizedBox(width: 10),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectMes = !selectMes;
                          selectTodos = false;
                          selectFechados = false;
                          selectPeriodo = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectMes
                            ? const Color.fromARGB(255, 0, 18, 213)
                            : Colors.white,
                        foregroundColor: selectMes
                            ? Colors.white
                            : const Color.fromARGB(255, 151, 151, 151),
                      ),
                      child: Text("Mês Atual"),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selecData,
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.centerLeft,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, size: 25),
                      SizedBox(width: 10),
                      Text("Buscar por data..."),
                    ],
                  ),
                ),
              ),

              Divider(
                color: const Color.fromARGB(41, 158, 158, 158),
                thickness: 2,
                height: 40,
                indent: 5,
                endIndent: 5,
              ),

              //FAZ TODAS AS BUSCAS
              Expanded(
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: buscarNaVM(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text("Nenhum dado encontrado!");
                    }

                    final fechamentos = snapshot.data!;

                    return ListView.builder(
                      itemCount: fechamentos.length,
                      itemBuilder: (context, index) {
                        final dados = fechamentos[index];

                        return Padding(
                          padding: EdgeInsetsGeometry.symmetric(vertical: 3),
                          child: SizedBox(
                            width: double.infinity,
                            height: 80,

                            child: ElevatedButton(
                              onPressed: () async {
                                await PdfService().gerarPdf(dados);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
                                ),
                              ),
                              child: Row(
                                spacing: 5,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsGeometry.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Icon(Icons.calendar_month_outlined),
                                  ),

                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsGeometry.symmetric(
                                        vertical: 15,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,

                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                DateFormat('dd/MM/yyyy').format(
                                                  (dados['Date'] as Timestamp)
                                                      .toDate(),
                                                ),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                DateFormat('HH:mm:ss').format(
                                                  (dados['Date'] as Timestamp)
                                                      .toDate()
                                                      .toLocal(),
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(width: 10),

                                          Column(
                                            children: [
                                              Text(
                                                formatoDinheiro.format(
                                                  dados["total"],
                                                ),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Text(
                                                "Fechado",
                                                style: TextStyle(
                                                  color: const Color.fromARGB(
                                                    255,
                                                    36,
                                                    155,
                                                    40,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  SizedBox(width: 10),

                                  SizedBox(
                                    child: Image.asset(
                                      'assets/exportar/exportar2.png',
                                      width: 35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),


      bottomNavigationBar: SafeArea(child: BottomNavigator()),

      /* bottomNavigationBar: SafeArea(
        child: Container(
          height: 50,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              ElevatedButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, "/");
                  setState(() {
                    selectInicio = !selectInicio;
                    selectCaixa = false;
                    selectRelatorios = false;
                    selectPdf = false;
                  });

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
                onPressed: () async{
                 await Navigator.pushNamed(context, "/novo_fechamento");
                  setState(() {
                    selectInicio = false;
                    selectCaixa = !selectCaixa;
                    selectRelatorios = false;
                    selectPdf = false;
                  });

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
                  await Navigator.pushNamed(context, "/historico_caixas");
                  setState(() {
                    selectInicio = false;
                    selectCaixa = !selectCaixa;
                    selectRelatorios = false;
                    selectPdf = false;
                  });

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
                  
                  
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: selectPdf
                      ? Colors.white
                      : const Color.fromARGB(255, 0, 18, 213),
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
                          ? 'assets/home_screen/pdf.png'
                          : 'assets/home_screen/pdf-white.png',
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ), */
    );
  }
}
