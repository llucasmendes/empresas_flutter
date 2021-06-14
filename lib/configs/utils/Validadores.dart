abstract class ValidadorCampoTexto {
  bool isTextoValido({String texto});
}

class ValidadorApelido extends ValidadorCampoTexto {
  @override
  bool isTextoValido(
      {int tamanhoMinimo = 6, String? texto, bool podeEspacoBranco = false}) {
    if (texto == null) {
      return false;
    }

    if (texto.contains(" ") && !podeEspacoBranco) {
      return false;
    }

    if (texto.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return false;
    }

    return texto.length >= tamanhoMinimo;
  }
}

class ValidadorTamanho extends ValidadorCampoTexto {
  @override
  bool isTextoValido({int tamanhoMinimo = 6, String? texto}) {
    if (texto == null) {
      return false;
    }

    return texto.length >= tamanhoMinimo;
  }
}

class ValidadorEmail extends ValidadorCampoTexto {
  @override
  bool isTextoValido({String? texto}) {
    if (texto == null) {
      return false;
    }

    final regex = RegExp(
        r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$");

    return regex.hasMatch(texto);
  }
}

class ValidadorPassword extends ValidadorCampoTexto {
  @override
  bool isTextoValido({String? texto}) {
    if (texto == null) {
      return false;
    }

    return texto.length > 5;
  }
}
