import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/model/self_service_model.dart';
import 'package:lab_clinicas_self_service/src/module/self_service/documents/widgets/document_box_widget.dart';
import 'package:lab_clinicas_self_service/src/module/self_service/self_service_controller.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> with MessageViewMixin {
  final SelfServiceController selfServiceController =
      Injector.get<SelfServiceController>();
  @override
  void initState() {
    messageListener(selfServiceController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    final documents = selfServiceController.model.documents;
    final totalHelthInsuranceCard =
        documents?[DocumentType.healthInsuranceCard]?.length ?? 0;
    final totalMedicalCard =
        documents?[DocumentType.mediacalOrder]?.length ?? 0;

    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            width: sizeOf.width * .85,
            margin: const EdgeInsets.only(top: 18),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/folder.png'),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'ADICIONAR DOCUMENTO',
                  style: LabClinicasTheme.subTitleSmallStyle,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Selecione o documento que deseja fotografar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: LabClinicasTheme.blueColor,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: sizeOf.width * .8,
                  height: 241,
                  child: Row(
                    children: [
                      DocumentBoxWidget(
                        icon: Image.asset('assets/images/id_card.png'),
                        uploaded: totalHelthInsuranceCard > 0,
                        label: 'CARTEIRINHA',
                        totalFiles: totalHelthInsuranceCard,
                        onTap: () async {
                          final filePath = await Navigator.of(context)
                              .pushNamed('self-service/documents/scan');
                          if (filePath != null && filePath != '') {
                            selfServiceController.registerDocument(
                              DocumentType.healthInsuranceCard,
                              filePath.toString(),
                            );
                            setState(() {});
                          }
                        },
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      DocumentBoxWidget(
                        icon: Image.asset('assets/images/document.png'),
                        uploaded: totalMedicalCard > 0,
                        label: 'PEDIDO MÉDICO',
                        totalFiles: totalMedicalCard,
                        onTap: () async {
                          final filePath = await Navigator.of(context)
                              .pushNamed('self-service/documents/scan');
                          if (filePath != null && filePath != '') {
                            selfServiceController.registerDocument(
                              DocumentType.mediacalOrder,
                              filePath.toString(),
                            );
                            setState(() {});
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Visibility(
                  visible: totalMedicalCard > 0 && totalHelthInsuranceCard > 0,
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: const BorderSide(
                              color: Colors.red,
                            ),
                            fixedSize: const Size.fromHeight(48),
                          ),
                          onPressed: () {
                            selfServiceController.clearDocuments();
                          },
                          child: const Text('REMOVER TODAS'),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: LabClinicasTheme.orangeColor,
                            fixedSize: const Size.fromHeight(48),
                          ),
                          onPressed: () async {
                            await selfServiceController.finalize();
                          },
                          child: const Text('FINALIZAR'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
