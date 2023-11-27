// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i13;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_storage/firebase_storage.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import '../../auth/domain.dart' as _i3;
import '../../auth/src/application/check_auth_status.dart' as _i7;
import '../../auth/src/application/log_out.dart' as _i9;
import '../../auth/src/application/sign_in.dart' as _i10;
import '../../auth/src/infrastructure/auth_service_impl.dart' as _i4;
import '../../user/domain.dart' as _i14;
import '../../user/infrastructure.dart' as _i16;
import '../../user/src/application/create_user.dart' as _i8;
import '../../user/src/application/get_profile_info.dart' as _i17;
import '../../user/src/application/update_user_info.dart' as _i18;
import '../../user/src/infrastructure/user_firebase_provider.dart' as _i11;
import '../../user/src/infrastructure/user_repository_impl.dart' as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AuthService>(() => _i4.AuthServiceImpl(
          gh<_i5.FirebaseAuth>(),
          gh<_i6.GoogleSignIn>(),
        ));
    gh.factory<_i7.CheckAuthStatus>(
        () => _i7.CheckAuthStatus(gh<_i3.AuthService>()));
    gh.factory<_i8.CreateUser>(() => _i8.CreateUser(gh<_i3.AuthService>()));
    gh.factory<_i9.LogOut>(() => _i9.LogOut(gh<_i3.AuthService>()));
    gh.factory<_i10.SignIn>(() => _i10.SignIn(gh<_i3.AuthService>()));
    gh.lazySingleton<_i11.UserFirebaseProvider>(() => _i11.UserFirebaseProvider(
          gh<_i12.FirebaseStorage>(),
          gh<_i13.FirebaseFirestore>(),
        ));
    gh.lazySingleton<_i14.UserRepository>(
        () => _i15.UserRepositoryImpl(gh<_i16.UserFirebaseProvider>()));
    gh.factory<_i17.GetProfileInfo>(
        () => _i17.GetProfileInfo(gh<_i14.UserRepository>()));
    gh.factory<_i18.UpdateUserInfo>(
        () => _i18.UpdateUserInfo(gh<_i14.UserRepository>()));
    return this;
  }
}
