import 'package:equatable/equatable.dart';

class GithubLanguageEntity extends Equatable {
  final String name;
  final String icon;
  final String average;
  final int total;

  const GithubLanguageEntity({
    required this.name,
    required this.icon,
    required this.average,
    required this.total,
  });

  static GithubLanguageEntity get empty => const GithubLanguageEntity(name: '', icon: '', average: '', total: 0);

  GithubLanguageEntity copyWith({
    String? name,
    String? icon,
    String? average,
    int? total,
  }) {
    return GithubLanguageEntity(
      name: name ?? this.name,
      icon: icon ?? this.icon,
      average: average ?? this.average,
      total: total ?? this.total,
    );
  }

  @override
  String toString() => 'GithubLanguageEntity(name: $name, icon: $icon, average: $average, total: $total)';

  @override
  List<Object?> get props => [name, icon, average, total];
}
