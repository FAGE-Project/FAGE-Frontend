import 'package:flutter/material.dart';
import 'package:fage/components/custom_text_form_field.dart';

class CadastroServico extends StatefulWidget {
  const CadastroServico({Key? key}) : super(key: key);

  @override
  _CadastroServicoState createState() => _CadastroServicoState();
}

class _CadastroServicoState extends State<CadastroServico> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final tempoEstimadoController = TextEditingController();
  final precoController = TextEditingController();

  void _cadastrarServico() {
    if (_formKey.currentState!.validate()) {
      String nome = nomeController.text;
      String tempoEstimado = tempoEstimadoController.text;
      String preco = precoController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Serviço cadastrado com sucesso!'),
        ),
      );

      nomeController.clear();
      tempoEstimadoController.clear();
      precoController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Serviço'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: nomeController,
                labelText: 'Nome do Serviço',
                prefixIcon: Icon(Icons.work),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                controller: tempoEstimadoController,
                labelText: 'Tempo Estimado (em horas)',
                keyboardType: TextInputType.number,
                prefixIcon: Icon(Icons.access_time),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                controller: precoController,
                labelText: 'Preço (em reais)',
                keyboardType: TextInputType.number,
                prefixIcon: Icon(Icons.attach_money),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _cadastrarServico,
                child: Text('Cadastrar Serviço'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
