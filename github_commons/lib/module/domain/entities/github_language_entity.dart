import 'package:equatable/equatable.dart';

class GithubLanguageEntity extends Equatable {
  final String name;
  final String icon;
  final String average;
  final int total;

  const GithubLanguageEntity({
    this.name = '',
    this.icon = '',
    this.average = '',
    this.total = 0,
  });

  GithubLanguageEntity copyWith(
      {String? name, String? icon, String? average, int? total}) {
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

  @override
  List<Object?> get props => [name, icon, average, total];
}
