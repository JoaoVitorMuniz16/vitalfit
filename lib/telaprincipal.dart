import 'package:flutter/material.dart';
import 'chat.dart';
import 'beneficios.dart';
import 'personal.dart';
import 'academias.dart';
import 'nutri.dart';
import 'premium.dart';
import 'loja.dart';

void main() {
  runApp(VantagensApp());
}

class VantagensApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VantagensPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class VantagensPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                PromoDetailPage("Growth Supplements"))),
                    child: Image.asset(
                      'image/telavip.jpeg',
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80),
              Text(
                'Mais vantagens. Menos limites.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'Nenhum anúncio, mais vantagens: descontos em grandes marcas e prioridade sempre que você precisar.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BeneficiosScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Vamos lá ?'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('PULAR'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Pesquisar...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MainScreen())),
                    child: Icon(Icons.chat_bubble, size: 28),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => PremiumScreen()),
                    ),
                    child: Icon(Icons.diamond, size: 28, color: Colors.amber),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _iconButton(context, 'PERSONAL', Icons.fitness_center,
                      PersonalPage()),
                  _iconButton(context, 'ACADEMIA', Icons.sports_gymnastics,
                      AcademiasPage()),
                  _iconButton(context, 'NUTRICIONISTA', Icons.restaurant,
                      NutricionistaPage()),
                  _iconButton(context, 'LOJAS', Icons.shopping_cart,
                      SuplementosScreen()),
                ],
              ),
              SizedBox(height: 20),
              _promoCard(
                context,
                image: 'image/growth_supplements.jpeg',
                description: '"Com Growth, o sucesso é o nosso destino."',
                instagram: '@growthsupplements',
                name: 'Growth Supplements',
              ),
              SizedBox(height: 20),
              _promoCard(
                context,
                image: 'image/mith.jpeg',
                description: '"Impulsione seu futuro com Mith Nation."',
                instagram: '@mithoficial',
                name: 'Mith',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconButton(
      BuildContext context, String label, IconData icon, Widget page) {
    return InkWell(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 30),
          ),
          SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  Widget _promoCard(BuildContext context,
      {required String image,
      required String description,
      required String instagram,
      required String name}) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => PromoDetailPage(name))),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(description),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.alternate_email, size: 16),
                      SizedBox(width: 4),
                      Text(instagram),
                      Spacer(),
                      Text(name),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AcademiaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericPage(title: "Academia");
  }
}

class LojasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericPage(title: "Lojas");
  }
}

class PromoDetailPage extends StatelessWidget {
  final String name;
  PromoDetailPage(this.name);

  @override
  Widget build(BuildContext context) {
    return GenericPage(title: name);
  }
}

class GenericPage extends StatelessWidget {
  final String title;
  GenericPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text("Conteúdo da página $title")),
    );
  }
}
