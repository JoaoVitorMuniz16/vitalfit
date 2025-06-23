import 'package:flutter/material.dart';
import 'telaprincipal.dart';

//tela da loja
void main() {
  runApp(SuplementosApp());
}

class SuplementosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SuplementosScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SuplementosScreen extends StatefulWidget {
  @override
  _SuplementosScreenState createState() => _SuplementosScreenState();
}

class _SuplementosScreenState extends State<SuplementosScreen> {
  String filtroSelecionado = 'Nenhum';

  final List<Map<String, String>> lojas = [
    {
      "nome": "Growth Suplementos",
      "descricao": "Descrição da loja",
      "imagem": "image/growth_supplements.jpeg"
    },
    {
      "nome": "Max Titanium",
      "descricao": "Descrição da loja",
      "imagem": "image/max.png"
    },
    {
      "nome": "Integral Medica",
      "descricao": "Descrição da loja",
      "imagem": "image/integralmedica.png"
    },
    {
      "nome": "Dark Suplementos",
      "descricao": "Descrição da loja",
      "imagem": "image/darklab.png"
    },
    {
      "nome": "Ronnie Coleman Suplementos",
      "descricao": "Descrição da loja",
      "imagem": "image/ronnie.png"
    },
  ];

  void _selecionarFiltro(String filtro) {
    setState(() {
      filtroSelecionado = filtro;
      // Aqui você pode aplicar o filtro de verdade (ordenar por preço, etc)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            // Top navigation
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text("Back"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: _selecionarFiltro,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    itemBuilder: (BuildContext context) {
                      return ['Preço', 'Avaliação'].map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                    child: Row(
                      children: [
                        Text(
                          "Filtrar",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Tab
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "Suplementos",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            // List
            Expanded(
              child: ListView.builder(
                itemCount: lojas.length,
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final loja = lojas[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(12),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          loja["imagem"]!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        loja["nome"]!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(loja["descricao"]!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
