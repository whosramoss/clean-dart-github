library github_commons;

// theme
export 'package:github_commons/shared/theme/github_theme.dart';

// usecases
export 'package:github_commons/module/domain/usecases/find_profile/i_find_profile.dart';
export 'package:github_commons/module/domain/usecases/find_repositories/i_find_repositories.dart';
export 'package:github_commons/module/domain/usecases/find_profile/i_find_profile.dart';

// entities
export 'package:github_commons/module/domain/entities/github_language_entity.dart';
export 'package:github_commons/module/domain/entities/github_profile_entity.dart';
export 'package:github_commons/module/domain/entities/github_repository_entity.dart';

// components
export 'package:github_commons/shared/components/github_background_widget.dart';
export 'package:github_commons/shared/components/github_bar_widget.dart';
export 'package:github_commons/shared/components/github_body_widget.dart';
export 'package:github_commons/shared/components/github_button_widget.dart';
export 'package:github_commons/shared/components/github_item_widget.dart';
export 'package:github_commons/shared/components/github_language_widget.dart';
export 'package:github_commons/shared/components/github_profile_widget.dart';
export 'package:github_commons/shared/components/github_repository_widget.dart';
export 'package:github_commons/shared/components/github_tabs_widget.dart';
export 'package:github_commons/shared/components/title_widget.dart';

// Utils
export 'package:github_commons/shared/utils/url_open/url_open.dart';
export 'package:github_commons/shared/utils/url_open/i_url_open.dart';

// Packages
export 'package:flutter_mobx/flutter_mobx.dart' hide version;
export 'package:flutter_modular/flutter_modular.dart';
export 'package:json_annotation/json_annotation.dart';
export 'package:mobx/mobx.dart' hide Interceptors, Interceptor, StringExtension;
export 'package:dio/dio.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:flutter_svg/svg.dart';
export 'package:equatable/equatable.dart';
