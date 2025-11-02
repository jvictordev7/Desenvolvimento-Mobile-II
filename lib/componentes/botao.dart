import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  static const corPadrao = Color.fromRGBO(224, 224, 224, 1); // cinza claro
  static const corOperacao = Color.fromRGBO(0, 0, 0, 1); // preto

  final String texto;
  final bool duplo;
  final Color cor;
  final void Function(String) callback;

  const Botao({
    super.key,
    required this.texto,
    this.duplo = false,
    this.cor = corPadrao,
    required this.callback,
  });

  const Botao.operacao({
    super.key,
    required this.texto,
    this.duplo = false,
    this.cor = corOperacao,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: duplo ? 2 : 1,
      child: CupertinoButton(
        color: cor,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        onPressed: () => callback(texto),
        child: Text(
          texto,
          style: TextStyle(
            color: cor == corOperacao ? Colors.white : Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
    );
  }
}
