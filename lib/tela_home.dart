

import 'package:aula1/restaurante.dart';

import 'package:flutter/material.dart';

import 'banco/restauranteDAO.dart';
import 'banco/usuarioDAO.dart';

class telaHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => telaHomeState();
}

class telaHomeState extends State<telaHome> {
  final nome = UsuarioDAO.usuarioLogado.nome;

  List<Restaurante> restaurantes = [];

  Future<void> carregarRestaurantes() async {
    final lista = await RestauranteDAO.listarTodos();
    setState(() {
      restaurantes = lista;
    });
  }

  // Lista de imagens
  final List<String> imagens = [
    'assets/restaurante1.png',
    'assets/restaurante2.png',
    'assets/restaurante3.png',
    'assets/restaurante4.png',
    'assets/restaurante5.png',
    'assets/restaurante6.png',
    'assets/restaurante7.png',
    'assets/restaurante8.png',
    'assets/restaurante9.png',
    'assets/restaurante10.png',
  ];

  @override
  void initState() {
    super.initState();
    carregarRestaurantes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá, $nome!'),
        actions: [
          Icon(Icons.construction_rounded),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: restaurantes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final r = restaurantes[index];

              // Atribuindo a imagem com base no índice do restaurante
              final imagemIndex = index % imagens.length;
              final imagem = imagens[imagemIndex];

              return GestureDetector(
                onTap: () {
                  // Ação ao clicar no restaurante
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      // Foto do restaurante
                      Image.asset(
                        imagem,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 8),
                      Text(
                        r.nome ?? 'Sem nome',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_sharp), label: 'carrinho'),
        BottomNavigationBarItem(icon: Icon(Icons.savings_rounded), label: 'descontos'),
        BottomNavigationBarItem(icon: Icon(Icons.delivery_dining), label: 'meus pedidos'),
      ]),
    );
  }
}

class ImagensSlides  extends StatelessWidget{
  const ImagensSlides({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for (final color in Colors.primaries)
          Container(width: 160, color: color),
      ],
    );
  }

}