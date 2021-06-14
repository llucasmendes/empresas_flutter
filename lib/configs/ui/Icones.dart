class IconesAplicacao {
  static String _comum({required String nomeIcone}) {
    return 'assets/pictures/$nomeIcone.png';
  }

  static String get background => _comum(nomeIcone: 'background');
  static String get backgroundMini => _comum(nomeIcone: 'background_mini');
  static String get iconeErro => _comum(nomeIcone: 'icone_erro');
  static String get iconeLupa => _comum(nomeIcone: 'icone_lupa');
  static String get iconeOlho => _comum(nomeIcone: 'icone_olho');
  static String get iconeVoltar => _comum(nomeIcone: 'icone_voltar');
  static String get logoHome => _comum(nomeIcone: 'logo_home');
  static String get logo => _comum(nomeIcone: 'logo');

  static String get iconeFaceBook => _comum(nomeIcone: 'icone_facebook');
  static String get iconeTwitter => _comum(nomeIcone: 'icone_twitter');
  static String get iconeEmail => _comum(nomeIcone: 'icone_email');

  static String get logoHome1 => _comum(nomeIcone: 'logo_home1');
  static String get logoHome2 => _comum(nomeIcone: 'logo_home2');
  static String get logoHome3 => _comum(nomeIcone: 'logo_home3');
  static String get logoHome4 => _comum(nomeIcone: 'logo_home4');

  static String get ellipseExterna => _comum(nomeIcone: 'ellipse_externa');
  static String get ellipseInterna => _comum(nomeIcone: 'ellipse_interna');
}
