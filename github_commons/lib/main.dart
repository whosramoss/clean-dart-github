library github_commons;

// theme
export 'package:github_commons/shared/theme/github_theme.dart';

// repositories
export 'package:github_commons/module/domain/repositories/i_github_repository.dart';
export 'package:github_commons/module/infra/repositories/github_repository.dart';

// datasources
export 'package:github_commons/module/external/datasources/github_datasource.dart';
export 'package:github_commons/module/infra/datasources/i_github_datasource.dart';

// usecases
export 'package:github_commons/module/domain/usecases/get_profile/get_profile.dart';
export 'package:github_commons/module/domain/usecases/get_profile/i_get_profile.dart';
export 'package:github_commons/module/domain/usecases/get_repositories/get_repositories.dart';
export 'package:github_commons/module/domain/usecases/get_repositories/i_get_repositories.dart';
export 'package:github_commons/module/domain/usecases/get_languages/get_languages.dart';
export 'package:github_commons/module/domain/usecases/get_languages/i_get_languages.dart';

// entities
export 'package:github_commons/module/domain/entities/github_language_entity.dart';
export 'package:github_commons/module/domain/entities/github_profile_entity.dart';
export 'package:github_commons/module/domain/entities/github_repository_entity.dart';
export 'package:github_commons/module/domain/entities/github_result_entity.dart';

// components
export 'package:github_commons/shared/components/github_profile_body_widget.dart';
export 'package:github_commons/shared/components/github_register_body_widget.dart';
export 'package:github_commons/shared/components/github_bar_widget.dart';

// Utils
export 'package:github_commons/shared/utils/url_open.dart';
export 'package:github_commons/module/domain/errors/github_errors.dart';
export 'package:github_commons/shared/routes/github_routes.dart';

// Packages
export 'package:json_annotation/json_annotation.dart';
export 'package:dio/dio.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:flutter_svg/svg.dart';
export 'package:equatable/equatable.dart';
export 'package:flutter_modular/flutter_modular.dart';
