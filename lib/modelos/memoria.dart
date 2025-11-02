import 'dart:math' as math;

class Memoria {
  static const operacoes = ['%', '/', '*', '-', '+', '=', '^'];
  final List<dynamic> _buffer = [0.0, '', 0.0];
  bool _ehPrimeiroNumero = true;
  bool _limparVisor = false;
  String _valor = '0';
  String _ultimoComando = '';

  String get valorNoVisor {
    if (_buffer[1] == '') {
      return _formataNumero(_buffer.first as double);
    } else if (operacoes.contains(_ultimoComando)) {
      return [
        _formataNumero(_buffer[0] as double),
        _buffer[1] as String,
      ].join(' ');
    } else {
      return [
        _formataNumero(_buffer[0] as double),
        _buffer[1] as String,
        _formataNumero(_buffer[2] as double),
      ].join(' ');
    }
  }

  void tratarDigito(String comando) {
    if (comando == '!') {
      _aplicaFatorial();
      return;
    }
    if (_estaSubstituindoOperacao(comando)) {
      _buffer[1] = comando;
      _ultimoComando = comando;
      return;
    }

    if (comando == 'C') {
      _limpar();
    } else if (operacoes.contains(comando)) {
      _setOperacao(comando);
    } else {
      _adicionarDigito(comando);
    }
    _ultimoComando = comando;
  }

  bool _estaSubstituindoOperacao(String comando) {
    return operacoes.contains(_ultimoComando) &&
        operacoes.contains(comando) &&
        _ultimoComando != '=' &&
        comando != '=';
  }

  void _limpar() {
    _valor = '0';
    _buffer.setAll(0, [0.0, '', 0.0]);
    _limparVisor = false;
    _ehPrimeiroNumero = true;
    _ultimoComando = '';
  }

  void _setOperacao(String novaOperacao) {
    final bool ehSinalDeIgual = novaOperacao == '=';

    if (_ehPrimeiroNumero) {
      if (!ehSinalDeIgual) {
        _ehPrimeiroNumero = false;
        _buffer[1] = novaOperacao;
      }
      _limparVisor = true;
    } else {
      _buffer[0] = _computa();
      _buffer[1] = ehSinalDeIgual ? '' : novaOperacao;
      _buffer[2] = 0.0;
      _valor = _formataNumero(_buffer[0] as double);
      _ehPrimeiroNumero = ehSinalDeIgual;
      _limparVisor = !ehSinalDeIgual;
    }
  }

  double _computa() {
    final double primeiroNumero = _buffer[0] as double;
    final double segundoNumero = _buffer[2] as double;

    switch (_buffer[1]) {
      case '%':
        return primeiroNumero % segundoNumero;
      case '/':
        return primeiroNumero / segundoNumero;
      case '*':
        return primeiroNumero * segundoNumero;
      case '-':
        return primeiroNumero - segundoNumero;
      case '+':
        return primeiroNumero + segundoNumero;
      case '^':
        return math.pow(primeiroNumero, segundoNumero).toDouble();
      default:
        return primeiroNumero;
    }
  }

  void _adicionarDigito(String digito) {
    final bool ehPonto = digito == '.' || digito == ',';
    final bool deveLimparValor = (_valor == '0' && !ehPonto) || _limparVisor;

    if (ehPonto && _valor.contains('.') && !deveLimparValor) {
      return;
    }

    final String valorVazio = ehPonto ? '0' : '';
    final String valorAtual = deveLimparValor ? valorVazio : _valor;
    final String caractere = digito == ',' ? '.' : digito;
    _valor = valorAtual + caractere;
    _limparVisor = false;
    _buffer[_ehPrimeiroNumero ? 0 : 2] = double.tryParse(_valor) ?? 0.0;
  }

  String _formataNumero(double n) {
    // Arredonda para evitar artefatos binários (ex.: 15.899999999999999)
    String s = n.toStringAsFixed(12);
    // Remove zeros à direita e ponto se ficar sobrando
    s = s.replaceFirst(RegExp(r'\.?0+$'), '');
    return s.replaceAll('.', ',');
  }

  void _aplicaFatorial() {
    final bool temOperador = (_buffer[1] as String).isNotEmpty;
    final bool noSegundo = temOperador && !_limparVisor && !_ehPrimeiroNumero;

    final int idx = noSegundo ? 2 : 0;
    final double valorAlvo = _buffer[idx] as double;

    if (valorAlvo < 0 || (valorAlvo % 1) != 0) {
      // Ignora fatorial para valores não inteiros ou negativos
      return;
    }
    final int n = valorAlvo.toInt();
    if (n > 170) {
      // Evita overflow de double
      return;
    }
    double r = 1.0;
    for (int i = 2; i <= n; i++) {
      r *= i;
    }
    _buffer[idx] = r;
    _valor = r.toString();

    if (noSegundo) {
      _ultimoComando = '!';
    } else {
      _ultimoComando = temOperador ? (_buffer[1] as String) : '!';
    }
    // Mantém _limparVisor e _ehPrimeiroNumero conforme o fluxo atual
  }
}
