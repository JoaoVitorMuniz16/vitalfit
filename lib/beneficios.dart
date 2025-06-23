import 'package:flutter/material.dart';
import 'telaprincipal.dart';

class BeneficiosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                ),
                child:
                    const Text("Back", style: TextStyle(color: Colors.black)),
              ),
              const SizedBox(height: 20),
              const Text(
                "Benefícios:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _benefitItem(
                icon: "🚫",
                title: "Sem anúncios:",
                description:
                    "Curta uma experiência 100% limpa e sem interrupções. Com o plano Vital Premium, você navega livremente, sem banners, pop-ups ou distrações.",
              ),
              const SizedBox(height: 16),
              _benefitItem(
                icon: "🎁",
                title: "Ganhe cupons ou itens:",
                description:
                    "Ganhe cupons incríveis, itens especiais e recompensas que só os assinantes Pro recebem.\nMais vantagens, mais surpresas!",
              ),
              const SizedBox(height: 16),
              _benefitItem(
                iconWidget: const Icon(Icons.verified_user_outlined,
                    color: Colors.grey),
                title: "Prioridade nos atendimentos:",
                description:
                    "Chega de esperar! Com o plano Pro, você é prioridade. Suporte mais rápido, eficiente e direto ao ponto, porque seu tempo vale mais.",
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _priceBox(
                      'R\$6.99/\nmensal', Colors.blue.shade100, Colors.blue),
                  const SizedBox(width: 16),
                  _priceBox('R\$59.99/\nanual', Colors.blue, Colors.white),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _benefitItem(
      {String? icon,
      Widget? iconWidget,
      required String title,
      required String description}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        iconWidget ?? Text(icon ?? "", style: const TextStyle(fontSize: 20)),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(description),
            ],
          ),
        ),
      ],
    );
  }

  Widget _priceBox(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: textColor),
      ),
    );
  }
}
