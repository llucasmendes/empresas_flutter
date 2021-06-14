abstract class IAppNavigator {
  irParaHome({
    bool podeVoltar = false,
  });
  irParaLogin({
    bool podeVoltar = false,
  });
  irParaPerfil({
    bool podeVoltar = true,
    required int enterpriseId,
  });
}
