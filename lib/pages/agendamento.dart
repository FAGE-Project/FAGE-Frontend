import 'package:fage/util/util.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';

class Agendamento extends StatefulWidget {
  const Agendamento({super.key});

  @override
  _AgendamentoScreenState createState() => _AgendamentoScreenState();
}

class _AgendamentoScreenState extends State<Agendamento> {
  DateTime _selectedDate = DateTime.now();
  int _selectedServiceIndexServico = 0;
  int _selectedServiceIndexFuncionario = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(child: Text('Serviços')),
          const Spacer(),
          Flexible(
            flex: 8,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Util.servicos.length,
              itemBuilder: (context, index) {
                return MaterialButton(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
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
                            color: index == _selectedServiceIndexServico
                                ? Colors.grey
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 38,
                          backgroundColor: Colors.transparent,
                          backgroundImage: Util.servicos[index]['image'],
                        ),
                      ),
                      Text(Util.servicos[index]['name']),
                    ],
                  ),
                );
              },
            ),
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
                onPressed: () {},
                child: const Text('Finalizar agendamento'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
