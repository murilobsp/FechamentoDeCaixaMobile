import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_file_saver/flutter_file_saver.dart';

class PdfService {
  Future<void> gerarPdf(Map<String, dynamic> dados) async {
    final pdf = pw.Document();

    final data = (dados["Date"] as Timestamp).toDate();
    final dataFormatada = DateFormat('dd/MM/yyyy HH:mm').format(data);
    final nomeArquivo = DateFormat('dd-MM-yyyy').format(data);
    

    final moeda = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    String valor(String campo) {
      return moeda.format((dados[campo] as num?) ?? 0);
    }

    final azul = PdfColor.fromHex('#0012D5');

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Cabeçalho
              pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.all(20),
                color: azul,
                child: pw.Column(
                  children: [
                    pw.Text(
                      "RELATÓRIO DE CAIXA",
                      style: pw.TextStyle(
                        color: PdfColors.white,
                        fontSize: 22,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(
                      "Resumo do fechamento",
                      style: const pw.TextStyle(
                        color: PdfColors.white,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),

              pw.SizedBox(height: 25),

              // Informações do fechamento
              pw.Text(
                "INFORMAÇÕES DO FECHAMENTO",
                style: pw.TextStyle(
                  fontSize: 13,
                  fontWeight: pw.FontWeight.bold,
                  color: azul,
                ),
              ),

              pw.SizedBox(height: 12),

              pw.Text("Data: $dataFormatada"),
              pw.SizedBox(height: 6),
              pw.Text("Status: ${dados['status']}"),

              pw.SizedBox(height: 25),

              // Resumo financeiro
              pw.Text(
                "RESUMO FINANCEIRO",
                style: pw.TextStyle(
                  fontSize: 13,
                  fontWeight: pw.FontWeight.bold,
                  color: azul,
                ),
              ),

              pw.SizedBox(height: 12),

              pw.TableHelper.fromTextArray(
                headers: ["Forma de pagamento", "Valor"],
                data: [
                  ["Dinheiro", valor("dinheiro")],
                  ["Crédito", valor("credito")],
                  ["Débito", valor("debito")],
                  ["Pix", valor("pix")],
                ],
                headerDecoration: pw.BoxDecoration(color: azul),
                headerStyle: pw.TextStyle(
                  color: PdfColors.white,
                  fontWeight: pw.FontWeight.bold,
                ),
                cellPadding: const pw.EdgeInsets.all(12),
                oddRowDecoration: const pw.BoxDecoration(
                  color: PdfColors.grey100,
                ),
                border: pw.TableBorder.all(
                  color: PdfColors.grey300,
                  width: 0.5,
                ),
                cellAlignments: {
                  0: pw.Alignment.centerLeft,
                  1: pw.Alignment.centerRight,
                },
              ),

              pw.SizedBox(height: 25),

              // Total
              pw.Container(
                padding: const pw.EdgeInsets.all(16),
                color: PdfColors.grey200,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "TOTAL DO FECHAMENTO",
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    pw.Text(
                      valor("total"),
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 18,
                        color: azul,
                      ),
                    ),
                  ],
                ),
              ),

              pw.SizedBox(height: 25),

              // Observações
              pw.Text(
                "OBSERVAÇÕES",
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 13,
                  color: azul,
                ),
              ),

              pw.SizedBox(height: 8),
              pw.Text(
                dados["obs"]?.toString().isNotEmpty == true
                    ? dados["obs"].toString()
                    : "Nenhuma observação registrada.",
              ),

              pw.Spacer(),

              pw.Divider(color: PdfColors.grey400),

              pw.Center(
                child: pw.Text(
                  "Documento gerado pelo sistema de fechamento de caixa",
                  style: const pw.TextStyle(
                    fontSize: 9,
                    color: PdfColors.grey600,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );

    await FlutterFileSaver().writeFileAsBytes(
      fileName: 'Fechamento$nomeArquivo.pdf',
      bytes: await pdf.save(),
    );
  }
}
