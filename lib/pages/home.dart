import 'package:fage/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/fage-logo-white.png", scale: 2),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.transparent,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_outline),
            label: "Meu Fage",
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            selectedIcon: Icon(Icons.search),
            label: "Pesquisar",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.calendar_today),
            icon: Icon(Icons.calendar_today_outlined),
            label: "Agendamentos",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: "Perfil",
          ),
        ],
      ),
      body: <Widget>[
        const Column(
          children: [
            CustomTextFormField(labelText: "Pesquisar", prefixIcon: Icons.search),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.transparent,
                          minRadius: 45,
                          backgroundImage:
                          AssetImage("assets/images/barbeiro.jpg")),
                      SizedBox(height: 10),
                      Text("Barbearias")
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.transparent,
                          minRadius: 45,
                          backgroundImage:
                          AssetImage("assets/images/barbeiro.jpg")),
                      SizedBox(height: 10),
                      Text("Salões de\nbeleza", textAlign: TextAlign.center)
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.transparent,
                          minRadius: 45,
                          backgroundImage:
                          AssetImage("assets/images/barbeiro.jpg")),
                      SizedBox(height: 10),
                      Text(
                        "Saúde &\nBem-estar",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.transparent,
                          minRadius: 45,
                          backgroundImage:
                          AssetImage("assets/images/barbeiro.jpg")),
                      SizedBox(height: 10),
                      Text(
                        "Spa &\nmassagem",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(),
        Container(),
        Container(),
      ][currentPageIndex],
    );
  }
}
