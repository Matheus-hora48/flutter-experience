import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:validatorless/validatorless.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  final formKey = GlobalKey<FormState>();
  final documentEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabClinicasAppBar(
        actions: [
          PopupMenuButton(
            child: const IconPopupMenuWidget(),
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Reinicia Processo'),
                ),
              ];
            },
            onSelected: (value) async {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (
          _,
          constraints,
        ) {
          var sizeOf = MediaQuery.sizeOf(context);
          return SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_login.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(40),
                  width: sizeOf.width * .8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Image.asset('assets/images/logo_vertical.png'),
                        const SizedBox(
                          height: 48,
                        ),
                        const Text(
                          'Bem-Vindo!',
                          style: LabClinicasTheme.titleStyle,
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        TextFormField(
                          controller: documentEC,
                          validator: Validatorless.required('CPF obrigatório'),
                          decoration: const InputDecoration(
                            label: Text('Digite o CPF do paciente'),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          width: sizeOf.width * .8,
                          child: ElevatedButton(
                            onPressed: () {
                              final valid =
                                  formKey.currentState?.validate() ?? false;
                              if (valid) {

                              }
                            },
                            child: const Text('CONTINUAR'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
