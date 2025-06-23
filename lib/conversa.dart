import 'package:flutter/material.dart';

void main() {
  runApp(ConversaEduardoApp());
}

class ConversaEduardoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversa Dr. Eduardo',
      debugShowCheckedModeBanner: false,
      home: ConversaEduardoPage(),
    );
  }
}

class ConversaEduardoPage extends StatefulWidget {
  @override
  _ConversaEduardoPageState createState() => _ConversaEduardoPageState();
}

class _ConversaEduardoPageState extends State<ConversaEduardoPage> {
  final TextEditingController _mensagemController = TextEditingController();

  List<Map<String, dynamic>> mensagens = [
    {"texto": "Olá, posso te ajudar com sua dieta!", "meu": false},
    {"texto": "Boa tarde, estou precisando sim!", "meu": true},
  ];

  void _enviarMensagem() {
    final texto = _mensagemController.text.trim();
    if (texto.isNotEmpty) {
      setState(() {
        mensagens.add({"texto": texto, "meu": true});
        _mensagemController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // voltar
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('image/dreduardo.jpeg'),
            ),
            SizedBox(width: 10),
            Text('Dr. Eduardo',
                style: TextStyle(color: Colors.black, fontSize: 18)),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: mensagens.length,
              itemBuilder: (context, index) {
                final msg = mensagens[index];
                return Align(
                  alignment:
                      msg["meu"] ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color:
                          msg["meu"] ? Colors.teal[300] : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      msg["texto"],
                      style: TextStyle(
                        color: msg["meu"] ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          _inputMensagem(),
        ],
      ),
    );
  }

  Widget _inputMensagem() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _mensagemController,
              decoration: InputDecoration(
                hintText: 'Digite sua mensagem...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.send, color: Colors.teal),
            onPressed: _enviarMensagem,
          ),
        ],
      ),
    );
  }
}
