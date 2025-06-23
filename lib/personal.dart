import 'package:flutter/material.dart'; // ajuste o nome se o app tiver outro
import 'telaprincipal.dart';

void main() {
  runApp(PersonalApp());
}

class PersonalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // modo debug visível
      title: 'Profissionais da Semana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PersonalPage(),
    );
  }
}

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  String _selectedFilter = 'Nenhum filtro';

  /// Exibe o modal de filtros e atualiza o texto escolhido.
  Future<void> _showFilterOptions(BuildContext context) async {
    final String? selected = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: const Text('Preço'),
              onTap: () => Navigator.pop(context, 'Preço'),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Local'),
              onTap: () => Navigator.pop(context, 'Local'),
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Avaliação'),
              onTap: () => Navigator.pop(context, 'Avaliação'),
            ),
            ListTile(
              leading: const Icon(Icons.trending_up),
              title: const Text('Popularidade'),
              onTap: () => Navigator.pop(context, 'Popularidade'),
            ),
          ],
        );
      },
    );

    if (selected != null) {
      setState(() => _selectedFilter = selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Botão Back
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child:
                    const Text('Back', style: TextStyle(color: Colors.black)),
              ),

              const SizedBox(height: 10),

              // Botão PERSONAL
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('PERSONAL',
                    style: TextStyle(color: Colors.white)),
              ),

              const SizedBox(height: 20),

              // Título
              const Text(
                'PROFISSIONAIS DA SEMANA',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // Destaques
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _highlightCard(38, 'image/robert.jpeg'),
                    const SizedBox(width: 10),
                    _highlightCard(42, 'image/1.png'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Linha do filtro (texto + botão com cor original)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filtro: $_selectedFilter',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  TextButton.icon(
                    onPressed: () => _showFilterOptions(context),
                    icon: const Icon(Icons.filter_list, color: Colors.black),
                    label: const Text(
                      'Filtrar',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      // sem cor de fundo → aparência igual ao layout original
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Lista de profissionais
              Expanded(
                child: ListView(
                  children: [
                    _professionalCard('Antônio', 'Descrição do Profissional', 5,
                        0.45, 'image/antonio.png'),
                    _professionalCard('Fred Loro', 'Descrição do Profissional',
                        4, 0.77, 'image/fredlouro.jpeg'),
                    _professionalCard('Severiano', 'Descrição do Profissional',
                        3, 0.48, 'image/severiano.jpeg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Card de destaque
  Widget _highlightCard(int idade, String imagePath) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Text(
            '$idade anos',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // Card da lista
  Widget _professionalCard(String name, String description, int stars,
      double progress, String imagePath) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(description, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 4),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < stars ? Icons.star : Icons.star_border,
                        size: 16,
                        color: Colors.amber,
                      );
                    }),
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      progress >= 0.7
                          ? Colors.orange
                          : progress >= 0.5
                              ? Colors.yellow
                              : Colors.lightGreen,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
