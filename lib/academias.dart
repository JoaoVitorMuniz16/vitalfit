import 'package:flutter/material.dart';
import 'telaprincipal.dart';

void main() {
  runApp(AcademiasApp());
}

class AcademiasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Academias Populares',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: AcademiasPage(),
    );
  }
}

class AcademiasPage extends StatefulWidget {
  @override
  _AcademiasPageState createState() => _AcademiasPageState();
}

class _AcademiasPageState extends State<AcademiasPage> {
  String _selectedFilter = 'Nenhum filtro';

  Future<void> _showFilterOptions(BuildContext context) async {
    final String? selected = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Preço'),
              onTap: () => Navigator.pop(context, 'Preço'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Local'),
              onTap: () => Navigator.pop(context, 'Local'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Avaliação'),
              onTap: () => Navigator.pop(context, 'Avaliação'),
            ),
            ListTile(
              leading: Icon(Icons.trending_up),
              title: Text('Popularidade'),
              onTap: () => Navigator.pop(context, 'Popularidade'),
            ),
          ],
        );
      },
    );

    if (selected != null) {
      setState(() {
        _selectedFilter = selected;
      });
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

              // Botão ACADEMIAS
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('ACADEMIAS',
                    style: TextStyle(color: Colors.white)),
              ),

              const SizedBox(height: 20),

              // Título "ACADEMIAS POPULARES"
              const Text(
                'ACADEMIAS POPULARES',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // Destaques
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _highlightCard('Ironpulse Fitness', 'assets/ironpulse.png'),
                    const SizedBox(width: 10),
                    _highlightCard('Elevate Fitness', 'assets/elevate.png'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Título + Filtro
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Academias',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  TextButton.icon(
                    onPressed: () => _showFilterOptions(context),
                    icon: const Icon(Icons.filter_list, color: Colors.black),
                    label: const Text('Filtrar',
                        style: TextStyle(color: Colors.black)),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Exibe o filtro selecionado
              Text(
                'Filtro: $_selectedFilter',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),

              // Lista de academias
              Expanded(
                child: ListView(
                  children: [
                    _gymCard('Ironpulse Fitness', 'Descrição do academia',
                        'Localização', 'image/ironpulse.png'),
                    _gymCard('AlphaForce', 'Descrição do academia',
                        'Localização', 'image/alphaforce.png'),
                    _gymCard('Elevate Fitness', 'Descrição do academia',
                        'Localização', 'image/elevate.png'),
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
  Widget _highlightCard(String name, String imagePath) {
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
          fontSize: 20,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              blurRadius: 8,
              color: Colors.black87,
              offset: Offset(2, 2),
            ),
          ],
        ),
      ),
    );
  }

  // Card de academia
  Widget _gymCard(
      String name, String description, String location, String imagePath) {
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
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(location,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
                    ],
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
