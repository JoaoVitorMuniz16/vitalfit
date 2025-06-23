import 'package:flutter/material.dart';
import 'nutri.dart';
import 'chat.dart'; // Certifique-se que esse arquivo existe

void main() => runApp(PerfilApp());

class PerfilApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PerfilPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            // Ícones superiores
            Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.grey[700]),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => NutricionistaPage()), // Corrigido aqui
          );
        },
      ),
      Row(
        children: [
          Icon(Icons.bookmark_border, color: Colors.grey[700]),
          SizedBox(width: 16),
          Icon(Icons.settings, color: Colors.grey[700]),
        ],
      ),
    ],
  ),
),

            // Foto e nome
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('image/dreduardo.jpeg'),
            ),
            SizedBox(height: 12),
            Text(
              'Dr. Eduardo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Nutricionista focado em saúde de verdade, com planos personalizados e sem dieta maluca. Alimentação equilibrada, prática e do seu jeito!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.5, color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 12),
            // Avaliação com estrelas
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(4,
                    (index) => Icon(Icons.star, color: Colors.amber, size: 20)),
                Icon(Icons.star_border, color: Colors.grey, size: 20),
                SizedBox(width: 8),
                Text('4.0', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20),
            // Avaliações
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  children: [
                    AvaliacaoCard(
                      nome: 'Pequeno Gigante',
                      data: '11/19',
                      texto:
                          'Nunca pensei que conseguiria emagrecer sem passar fome. Com o plano do Dr. Eduardo, aprendi a comer bem e cuidar de mim de verdade!',
                    ),
                    AvaliacaoCard(
                      nome: 'João Vitor Muniz',
                      data: '11/19',
                      texto:
                          'O Dr. Eduardo é super atencioso e entende nossa rotina. Meu colesterol baixou e ainda ganhei mais energia no dia a dia!',
                    ),
                  ],
                ),
              ),
            ),
            // Botão de conversar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFCD6A23),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => MainScreen()),
                  );
                },
                child: Text(
                  'Conversar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvaliacaoCard extends StatelessWidget {
  final String nome;
  final String data;
  final String texto;

  AvaliacaoCard({required this.nome, required this.data, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$nome  •  $data',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(texto, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
