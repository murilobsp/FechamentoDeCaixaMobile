import 'package:fechamento_caixa/features/novo_fechamento/model/novo_fechamento_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fechamento_caixa/features/novo_fechamento/viewmodel/novo_fechamento_viewmodel.dart';

bool selectInicio = false;
bool selectCaixa = false;
bool selectRelatorios = false;
bool selectMais = false;

//CONTROLLER PARA PEGAR VALOR DAS TEXTFIELD

final dinheiroController = TextEditingController();
final creditoController = TextEditingController();
final debitoController = TextEditingController();
final pixController = TextEditingController();
final observacoesController = TextEditingController();
final retiradacaixaController = TextEditingController();

final formatoDinheiro = NumberFormat.currency(locale: "pt_BR", symbol: "R\$");

//CRIA OBJETO PARA PEGAR OS DADOS
NovoFechamentoModel? fechamento;

//CRIA OBJETO DA VM PARA MANDAR OS DADOS DELA
final viewModel = NovoFechamentoViewmodel();

//GET PARA RECEBER OS VALORES DO MODEL
//E EXIBIR EM TEMPO REAL
double get total {
  final dinheiro = double.tryParse(dinheiroController.text) ?? 0;
  final credito = double.tryParse(creditoController.text) ?? 0;
  final debito = double.tryParse(debitoController.text) ?? 0;
  final pix = double.tryParse(pixController.text) ?? 0;

  return dinheiro + credito + debito + pix;
}

double get iniciocaixa {
  final dinheiro = double.tryParse(dinheiroController.text) ?? 0;
  final retirada = double.tryParse(retiradacaixaController.text) ?? 0;

  return dinheiro - retirada;
}



class NovoFechamentoScreen extends StatefulWidget {
  const NovoFechamentoScreen({super.key});

  @override
  State<NovoFechamentoScreen> createState() => _NovoFechamentoScreenState();
}

class _NovoFechamentoScreenState extends State<NovoFechamentoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 18, 213),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Novo Fechamento",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      height: 50,
                      child: Text(
                        "Valores do Caixa",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            children: [
                              Icon(Icons.money, size: 40, color: Colors.green),
                              SizedBox(width: 20),
                              Text("Dinheiro em espécie"),
                            ],
                          ),

                          SizedBox(
                            width: 130,
                            height: 50,
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              controller: dinheiroController,
                              onChanged: (valor) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                hintText: 'R\$',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.credit_card,
                                size: 40,
                                color: const Color.fromARGB(255, 0, 18, 213),
                              ),
                              SizedBox(width: 20),
                              Text("Crédito"),
                            ],
                          ),

                          SizedBox(
                            width: 130,
                            height: 50,
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              controller: creditoController,
                              onChanged: (valor) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                hintText: 'R\$',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.credit_card_sharp,
                                size: 40,
                                color: const Color.fromARGB(255, 0, 18, 213),
                              ),
                              SizedBox(width: 20),
                              Text("Débito"),
                            ],
                          ),

                          SizedBox(
                            width: 130,
                            height: 50,
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              controller: debitoController,

                              onChanged: (valor) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                hintText: 'R\$',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.pix, size: 40, color: Colors.grey),
                              SizedBox(width: 20),
                              Text("Pix"),
                            ],
                          ),

                          SizedBox(
                            width: 130,
                            height: 50,
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              controller: pixController,
                              onChanged: (valor) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                hintText: 'R\$',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(vertical: 5),

                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(116, 158, 158, 158),
                            ),

                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total de vendas:",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  formatoDinheiro.format(total),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Observações (opcional)",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,

                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: observacoesController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Ex: Troco de R\$ 50,00, sem pendências",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.deepPurple,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SafeArea(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 30),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        final confirmar = await showDialog<bool>(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: Center(
                                    child: Text("Retirada do Caixa"),
                                  ),

                                  content: SizedBox(
                                    //width: double.infinity,
                                    width: 280,

                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,

                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              spacing: 10,
                                              children: [
                                                Image.asset(
                                                  'assets/novo_fechamento/cifrao.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                                Text(
                                                  "Valor em dinheiro: ",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),

                                                Text(
                                                  formatoDinheiro.format(
                                                    double.tryParse(
                                                          dinheiroController
                                                              .text,
                                                        ) ??
                                                        0,
                                                  ),
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.visible,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        Divider(
                                          color: const Color.fromARGB(
                                            41,
                                            158,
                                            158,
                                            158,
                                          ),
                                          thickness: 2,
                                          height: 30,
                                        ),

                                        SizedBox(
                                          //height: 45,
                                          //width: 260,

                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                spacing: 10,
                                                children: [
                                                  Image.asset(
                                                    'assets/novo_fechamento/setaBaixo.png',
                                                    width: 40,
                                                    height: 40,
                                                  ),
                                                  Text(
                                                    "Valor de retirada: ",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  controller:
                                                      retiradacaixaController,
                                                  onChanged: (valor) {
                                                    setState(() {});
                                                  },
                                                  keyboardType:
                                                      TextInputType.numberWithOptions(
                                                        decimal: true,
                                                      ),
                                                  decoration: InputDecoration(
                                                    labelText: "R\$ ",

                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Divider(
                                          color: const Color.fromARGB(
                                            41,
                                            158,
                                            158,
                                            158,
                                          ),
                                          thickness: 2,
                                          height: 30,
                                        ),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,

                                          children: [
                                            Row(
                                              spacing: 10,
                                              children: [
                                                Image.asset(
                                                  'assets/novo_fechamento/restos.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                                Text(
                                                  "Restante em caixa: ",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),

                                            Text(
                                              " ${formatoDinheiro.format(iniciocaixa)}",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: Size(115, 40),

                                        foregroundColor: const Color.fromARGB(
                                          211,
                                          0,
                                          0,
                                          0,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            22,
                                          ),
                                          side: BorderSide(
                                            color: const Color.fromARGB(
                                              123,
                                              158,
                                              158,
                                              158,
                                            ),
                                          ),
                                        ),
                                      ),

                                      onPressed: () {
                                        Navigator.pop(context, false);
                                      },

                                      child: Text("Cancelar"),
                                    ),

                                    ElevatedButton(
                                      onPressed: () async {
                                        final inicio =
                                            await viewModel.buscarInicio() ?? 0;

                                        final entradas = total - inicio;

                                        final idCaixa = await viewModel
                                            .buscarCaixaAberto();

                                        final fechamento = NovoFechamentoModel(
                                          dinheiro:
                                              double.tryParse(
                                                dinheiroController.text,
                                              ) ??
                                              0,
                                          credito:
                                              double.tryParse(
                                                creditoController.text,
                                              ) ??
                                              0,
                                          debito:
                                              double.tryParse(
                                                debitoController.text,
                                              ) ??
                                              0,
                                          pix:
                                              double.tryParse(
                                                pixController.text,
                                              ) ??
                                              0,
                                          obs: observacoesController.text,
                                          saldoFinal: iniciocaixa,
                                          status: "",
                                          entradas: entradas,
                                          //saidas: ValorSaidas,
                                        );
                                        await viewModel.finalizarFechamento(
                                          fechamento,
                                          idCaixa,
                                        );

                                        await viewModel.salvarFechamento(
                                          fechamento,
                                        );

                                        if (!context.mounted) return;

                                        Navigator.pop(context, true);
                                      },
                                      child: Text(
                                        "Confirmar",
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
                                );
                              },
                            );
                          },
                        );

                        if (confirmar != true || !context.mounted) return;

                        if (!context.mounted) return;

                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 18, 213),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                      ),
                      child: Text("Finalizar Fechamento"),
                    ),
                  ),
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
                onPressed: () async {
                 
                  await Navigator.pushNamed(context, "/");
                  setState(() {
                    selectInicio = !selectInicio;
                    selectCaixa = false;
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
                onPressed: () {},
                  

                style: ElevatedButton.styleFrom(
                  backgroundColor: selectCaixa
                      ? Colors.white
                      : const Color.fromARGB(255, 0, 18, 213),
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
                          ? 'assets/home_screen/caixa-registradora.png'
                          : 'assets/home_screen/caixa-registradora-white.png',
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
