import 'package:flutter/material.dart';

class ConfigAgendaScreen extends StatefulWidget {
  @override
  _ConfigAgendaScreenState createState() => _ConfigAgendaScreenState();
}

class _ConfigAgendaScreenState extends State<ConfigAgendaScreen> {
  late String _nomeEmpresa;
  late String _tipoServico;
  late DateTime _dataSelecionada;
  late TimeOfDay _horarioSelecionado;

  Future<void> _buscarDadosEmpresa() async {
    // API
  }

  Future<void> _confirmarAgendamento() async {
    // API
  }

  @override
  void initState() {
    super.initState();
    _buscarDadosEmpresa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuração de Agendamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome da Empresa'),
            TextFormField(
              initialValue: _nomeEmpresa,
              onChanged: (value) {
                setState(() {
                  _nomeEmpresa = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('Tipo de Serviço'),
            TextFormField(
              initialValue: _tipoServico,
              onChanged: (value) {
                setState(() {
                  _tipoServico = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('Data Selecionada'),
            InkWell(
              onTap: () async {
                final DateTime? dataSelecionada = await showDatePicker(
                  context: context,
                  initialDate: _dataSelecionada ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );
                if (dataSelecionada != null) {
                  setState(() {
                    _dataSelecionada = dataSelecionada;
                  });
                }
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _dataSelecionada != null
                          ? '${_dataSelecionada.day}/${_dataSelecionada.month}/${_dataSelecionada.year}'
                          : 'Selecione a data',
                    ),
                    Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Horário Selecionado'),
            InkWell(
              onTap: () async {
                final TimeOfDay? horarioSelecionado = await showTimePicker(
                  context: context,
                  initialTime: _horarioSelecionado ?? TimeOfDay.now(),
                );
                if (horarioSelecionado != null) {
                  setState(() {
                    _horarioSelecionado = horarioSelecionado;
                  });
                }
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _horarioSelecionado != null
                          ? '${_horarioSelecionado.hour}:${_horarioSelecionado.minute}'
                          : 'Selecione o horário',
                    ),
                    Icon(Icons.access_time),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}
