import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';

class Agendamento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDatePickerScreen(),
    );
  }
}

class MyDatePickerScreen extends StatefulWidget {
  @override
  _MyDatePickerScreenState createState() => _MyDatePickerScreenState();
}

class _MyDatePickerScreenState extends State<MyDatePickerScreen> {
  DateTime _selectedDate = DateTime.now();
  int _selectedServiceIndexServico = 0;
  final List<Map<String, dynamic>> _servicos = [
    {'name': 'Serviço 1', 'image': AssetImage('assets/images/barbeiro.jpg')},
    {'name': 'Serviço 2', 'image': AssetImage('assets/images/barbeiro.jpg')},
    {'name': 'Serviço 3', 'image': AssetImage('assets/images/barbeiro.jpg')},
    {'name': 'Serviço 4', 'image': AssetImage('assets/images/barbeiro.jpg')},
    {'name': 'Serviço 5', 'image': AssetImage('assets/images/barbeiro.jpg')},
    {'name': 'Serviço 6', 'image': AssetImage('assets/images/barbeiro.jpg')},
    {'name': 'Serviço 7', 'image': AssetImage('assets/images/barbeiro.jpg')},
  ];

  int _selectedServiceIndexFuncionario = 0;
  final List<Map<String, dynamic>> _funcionarios = [
    {'name': 'Funcionario 1', 'image': AssetImage('assets/images/fun1.png')},
    {'name': 'Funcionario 2', 'image': AssetImage('assets/images/fun2.jpg')},
    {'name': 'Funcionario 3', 'image': AssetImage('assets/images/fun1.png')},
    {'name': 'Funcionario 4', 'image': AssetImage('assets/images/fun2.jpg')},
    {'name': 'Funcionario 5', 'image': AssetImage('assets/images/fun1.png')},
    {'name': 'Funcionario 6', 'image': AssetImage('assets/images/fun2.jpg')},
    {'name': 'Funcionario 7', 'image': AssetImage('assets/images/fun1.png')},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamento'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Serviços',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 125,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _servicos.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedServiceIndexServico = index;
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
                              color: index == _selectedServiceIndexServico
                                  ? Colors.grey
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 38,
                            backgroundColor: Colors.transparent,
                            backgroundImage: _servicos[index]['image'],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(_servicos[index]['name']),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Funcionarios',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 125,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _funcionarios.length,
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
                            backgroundImage: _funcionarios[index]['image'],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(_funcionarios[index]['name']),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Data',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: DatePicker(
              DateTime.now(),
              width: 60,
              height: 80,
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
              locale: 'pt', // Define a localização como português
            ),
          ),
        ],
      ),
    );
  }
}
