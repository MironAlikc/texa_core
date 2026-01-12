// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/fake_login/auth_cubit.dart' as _i351;
import '../l10n/locale_cubit/locale_cubit.dart' as _i555;
import '../navigation/app_router.dart' as _i630;
import '../theme/theme_cubit/theme_cubit.dart' as _i613;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i555.LocaleCubit>(
      () => _i555.LocaleCubit(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i613.ThemeCubit>(
      () => _i613.ThemeCubit(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i351.AuthCubit>(
      () => _i351.AuthCubit(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i630.AppRouter>(
      () => _i630.AppRouter(gh<_i351.AuthCubit>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
