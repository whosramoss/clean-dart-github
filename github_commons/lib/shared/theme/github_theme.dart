class GithubTheme {
  GithubTheme._();

  static String getIcon(String name) {
    return 'https://raw.githubusercontent.com/devicons/devicon/master/icons/$name/$name-original.svg';
  }
}
