import 'package:flutter/material.dart';
import 'package:flutter_test_application/widgets/FormulairePage.dart';


class TroisiemePage extends StatelessWidget {
  const TroisiemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulaire")),
      body: FormulairePage()
    );
  }
}