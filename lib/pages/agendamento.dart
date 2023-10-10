import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:fage/controller/agendamento_controller.dart';
import 'package:fage/controller/servico_controller.dart';
import 'package:fage/dto/agendamento_dto.dart';
import 'package:fage/dto/empresa_dto.dart';
import 'package:fage/dto/pessoa_dto.dart';
import 'package:fage/dto/servico_dto.dart';
import 'package:fage/util/util.dart';
import 'package:flutter/material.dart';

class Agendamento extends StatefulWidget {
  final EmpresaDTO empresaDTO;
  const Agendamento({super.key, required this.empresaDTO});

  @override
  _AgendamentoScreenState createState() => _AgendamentoScreenState();
}

class _AgendamentoScreenState extends State<Agendamento> {
  DateTime _selectedDate = DateTime.now();
  int _selectedServiceIndexServico = 0;
  int _selectedServiceIndexFuncionario = 0;
  late Future<List<ServicoDto>> listFuture;

  @override
  void initState() {
    super.initState();

    listFuture = ServicoController.buscarServicosPorEmpresa(widget.empresaDTO.id!);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.empresaDTO.nome!)),
      body: Column(
        children: [
          const Center(child: Text('Serviços')),
          const Spacer(),
          Flexible(
            flex: 8,
            child: FutureBuilder(
                future: listFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => MaterialButton(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              onPressed: () {
                                setState(() {
                                  _selectedServiceIndexServico = index;
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: _selectedServiceIndexServico == index ? Colors.grey : Colors.transparent,
                                        width: 3,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: 38,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(
                                          snapshot.data![index].foto!),
                                    ),
                                  ),
                                  Text(snapshot.data![index].nome!),
                                ],
                              ),
                            ));
                  }
                  return CircularProgressIndicator();
                }),
          ),
          const Spacer(),
          const Center(child: Text('Funcionários')),
          const Spacer(),
          Flexible(
            flex: 9,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Util.funcionarios.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedServiceIndexFuncionario = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: index == _selectedServiceIndexFuncionario
                                  ? Colors.grey
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 38,
                            backgroundColor: Colors.transparent,
                            backgroundImage: Util.funcionarios[index]['image'],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(Util.funcionarios[index]['name']),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          const Center(child: Text('Data do agendamento')),
          const Spacer(),
          Flexible(
            flex: 9,
            child: DatePicker(
              DateTime.now(),
              height: 90,
              controller: DatePickerController(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.grey,
              selectedTextColor: Colors.white,
              inactiveDates: [
                DateTime.now().add(Duration(days: -1)),
              ],
              onDateChange: (date) {
                // New date selected
                setState(() {
                  _selectedDate = date;
                });
              },
              locale: 'pt_BR',
            ),
          ),
          const Spacer(flex: 7),
          Flexible(
            flex: 4,
            child: Center(
              child: FilledButton(
                onPressed: () async {
                  var agendamentoDto = AgendamentoDto(
                      servicoDto: ServicoDto(id: _selectedServiceIndexServico + 1),
                      dataHora: _selectedDate,
                      pessoa: PessoaDto(
                          email: "tilapia@gmail.com",
                          nome: "Tilapia da Silva",
                          id: 1,
                          documento: "958.200.690-05",
                          password: "tilapia"));
                  var success =
                      await AgendamentoController.cadastrar(agendamentoDto);
                  if (success) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Serviço agendado com sucesso!"),
                        content: Text(
                            "Agora é só esperar o dia chegar para aproveitar o seu serviço!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Text("Beleza!"),
                          )
                        ],
                      ),
                    );
                  }
                },
                child: const Text('Finalizar agendamento'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
