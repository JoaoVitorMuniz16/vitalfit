import 'package:flutter/material.dart';
import 'perfil.dart';
import 'telaprincipal.dart';

void main() {
  runApp(NutricionistaApp());
}

class NutricionistaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutricionistas da Semana',
      theme: ThemeData(primarySwatch: Colors.green),
      home: NutricionistaPage(),
    );
  }
}

class NutricionistaPage extends StatefulWidget {
  @override
  _NutricionistaPageState createState() => _NutricionistaPageState();
}

class _NutricionistaPageState extends State<NutricionistaPage> {
  String _selectedFilter = 'Nenhum filtro';

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
              // Botão voltar
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => VantagensPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Back', style: TextStyle(color: Colors.black)),
              ),
              const SizedBox(height: 10),

              Text(
                'Bem-vindo à página de Nutricionistas!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('NUTRICIONISTA',
                    style: TextStyle(color: Colors.white)),
              ),

              const SizedBox(height: 20),

              const Text(
                'NUTRICIONISTAS DA SEMANA',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // Destaques (imagem grande do Dr. Eduardo – não clicável)
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _highlightCard('image/dreduardo.jpeg', 'Dr. Eduardo'),
                    const SizedBox(width: 10),
                    _highlightCard('image/nutrition_background.jpeg', 'Nutrição'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Filtro
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
                    _professionalCard(
                      context,
                      name: 'Dr. Sávio',
                      description: 'Especialista em nutrição esportiva',
                      stars: 5,
                      progress: 0.45,
                      imagePath: 'image/drsavio.jpeg',
                      isEduardo: false,
                    ),
                    _professionalCard(
                      context,
                      name: 'Dr. Bruno',
                      description: 'Especialista em emagrecimento',
                      stars: 4,
                      progress: 0.75,
                      imagePath: 'image/drbruno.jpeg',
                      isEduardo: false,
                    ),
                    _professionalCard(
                      context,
                      name: 'Dr. Eduardo',
                      description: 'Atendimento clínico geral',
                      stars: 4,
                      progress: 0.6,
                      imagePath: 'image/dreduardo.jpeg',
                      isEduardo: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _highlightCard(String imagePath, String name) {
    return Container(
      width: 200,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(10),
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          shadows: [Shadow(blurRadius: 3, color: Colors.black)],
        ),
      ),
    );
  }

  Widget _professionalCard(
  BuildContext context, {
  required String name,
  required String description,
  required int stars,
  required double progress,
  required String imagePath,
  required bool isEduardo,
}) {
  return InkWell(
    onTap: isEduardo
        ? () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => PerfilPage()),
            );
          }
        : null, // desativa o clique para os demais
    child: Card(
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
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                      progress >= 1.0
                          ? Colors.green
                          : progress >= 0.7
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
    ),
  );
}

}
