import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fechamento_caixa/features/historico_de_caixas/viewmodel/historico_de_caixa_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:fechamento_caixa/features/novo_fechamento/view/novo_fechamento_screen.dart';
import 'package:intl/intl.dart';

bool selectTodos = false;
bool selectFechados = false;
bool selectMes = false;
bool selectPeriodo = false;

DateTime? dataInicio;
DateTime? dataFim;

//REFERENCIA O VIEWMODELS PARA USAR A FUNCAO
final HistoricoDeCaixaViewmodels viewmodels = HistoricoDeCaixaViewmodels();

class HistoricoCaixasScreen extends StatefulWidget {
  const HistoricoCaixasScreen({super.key});

  @override
  State<HistoricoCaixasScreen> createState() => _HistoricoCaixasScreenState();
}

class _HistoricoCaixasScreenState extends State<HistoricoCaixasScreen> {
  
  Future<List<Map<String, dynamic>>>? resultadoPeriodo;


  Future<List<Map<String, dynamic>>> buscarNaVM() {
    if (selectTodos == true) {
      return viewmodels.buscarFechamentos();
    } else if (selectFechados == true) {
      return viewmodels.buscarFechados();
    } else if (selectMes == true) {
      return viewmodels.buscaporMes(DateTime.now());
    } else if (selectPeriodo == true) {
      return resultadoPeriodo!;
    }

    return Future.value([]);
  }


  Future<void> selecData() async {
    final data = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
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
      backgroundColor: const Color.fromARGB(250, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          "Histórico de Caixas",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
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
              SizedBox(height: 5),

              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                          selectFechados = !selectFechados;
                          selectTodos = false;
                          selectMes = false;
                          selectPeriodo = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectFechados
                            ? const Color.fromARGB(255, 0, 18, 213)
                            : Colors.white,
                        foregroundColor: selectFechados
                            ? Colors.white
                            : const Color.fromARGB(255, 151, 151, 151),
                      ),
                      child: Text("Fechados"),
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
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    "/relatorio_caixa",
                                    arguments: dados,
                                  );
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
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsGeometry.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Icon(
                                        Icons.calendar_month_outlined,
                                      ),
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
                                                  DateFormat(
                                                    'dd/MM/yyyy',
                                                  ).format(
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
                                    SizedBox(
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
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
    );
  }
}
