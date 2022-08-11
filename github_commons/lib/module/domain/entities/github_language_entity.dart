class GithubLanguageEntity {
  final String name;
  final String icon;
  final double average;
  final int total;

  const GithubLanguageEntity({
    this.name = '',
    this.icon = '',
    this.average = 0.0,
    this.total = 0,
  });

  bool get isValid => name.isNotEmpty;

  GithubLanguageEntity copyWith(
      {String? name, String? icon, double? average, int? total}) {
    return GithubLanguageEntity(
      name: name ?? this.name,
      icon: icon ?? this.icon,
      average: average ?? this.average,
      total: total ?? this.total,
    );
  }

  @override
  String toString() =>
      'GithubLanguageEntity(name: $name, icon: $icon, average: $average, total: $total)';
}
