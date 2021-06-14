abstract class Strings {
  static const email = 'Email';
  static const senha = 'Senha';
  static const entrar = 'ENTRAR';
  static const textoTopClipper = 'Seja bem vindo ao empresas!';
  static const credenciaisInvalidas = 'Credenciais incorretas';
  static String erroAoDecodificar(String nomeModelo) =>
      'Erro ao decodificar $nomeModelo';

  static String totaisEncontrados(int quantidadeItens) {
    if (quantidadeItens > 1) return '$quantidadeItens resultados encontrados';

    return '$quantidadeItens resultado encontrado';
  }

  static const problemasComServidor =
      'Tivemos um problema com o servidor, tente novamente!';
  static const dispositivoSemInternet = 'Dispositivo sem internet';
  static const tentarNovamente = 'Tentar Novamente';
  static const offline = 'Você está Off-line';
  static const naoConseguimosVerificarInternet =
      'Não conseguimos verificar sua conexão com a internet.';

  static const tenteMaisTarde =
      'Parece que ocorreu algum erro, por favor tente mais tarde.';
  static const desculpe = 'Desculpe... Algo não está certo.';

  static const pesquisePorEmpresas = 'Pesquise por empresa';
}
