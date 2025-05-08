// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i18;
import 'package:image_picker/image_picker.dart' as _i17;
import 'package:shamba/src/features/auth/presentation/signup/screens/signup.dart'
    as _i7;
import 'package:shamba/src/features/awareness/screens/awareness.dart' as _i3;
import 'package:shamba/src/features/onboarding/language/choose_language.dart'
    as _i5;
import 'package:shamba/src/features/onboarding/thememode/choose_theme.dart'
    as _i6;
import 'package:shamba/src/features/onboarding/welcome/welcome.dart' as _i15;
import 'package:shamba/src/features/records/medical_records.dart' as _i11;
import 'package:shamba/src/features/scan/home.dart' as _i10;
import 'package:shamba/src/features/scan/presentation/disease.dart' as _i8;
import 'package:shamba/src/features/scan/presentation/widgets/farms.dart'
    as _i19;
import 'package:shamba/src/features/scan/screening.dart' as _i12;
import 'package:shamba/src/features/scan/self_exam.dart' as _i13;
import 'package:shamba/src/features/settings/account_settings.dart' as _i1;
import 'package:shamba/src/features/settings/app_settings.dart' as _i2;
import 'package:shamba/src/features/settings/billing_settings.dart' as _i4;
import 'package:shamba/src/features/settings/edit_profile.dart' as _i9;
import 'package:shamba/src/features/settings/settings.dart' as _i14;

/// generated route for
/// [_i1.AccountSettings]
class AccountSettings extends _i16.PageRouteInfo<void> {
  const AccountSettings({List<_i16.PageRouteInfo>? children})
    : super(AccountSettings.name, initialChildren: children);

  static const String name = 'AccountSettings';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountSettings();
    },
  );
}

/// generated route for
/// [_i2.AppSettings]
class AppSettings extends _i16.PageRouteInfo<void> {
  const AppSettings({List<_i16.PageRouteInfo>? children})
    : super(AppSettings.name, initialChildren: children);

  static const String name = 'AppSettings';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i2.AppSettings();
    },
  );
}

/// generated route for
/// [_i3.Awareness]
class Awareness extends _i16.PageRouteInfo<void> {
  const Awareness({List<_i16.PageRouteInfo>? children})
    : super(Awareness.name, initialChildren: children);

  static const String name = 'Awareness';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.Awareness();
    },
  );
}

/// generated route for
/// [_i4.BillingSettings]
class BillingSettings extends _i16.PageRouteInfo<void> {
  const BillingSettings({List<_i16.PageRouteInfo>? children})
    : super(BillingSettings.name, initialChildren: children);

  static const String name = 'BillingSettings';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i4.BillingSettings();
    },
  );
}

/// generated route for
/// [_i5.ChooseLanguage]
class ChooseLanguage extends _i16.PageRouteInfo<void> {
  const ChooseLanguage({List<_i16.PageRouteInfo>? children})
    : super(ChooseLanguage.name, initialChildren: children);

  static const String name = 'ChooseLanguage';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i5.ChooseLanguage();
    },
  );
}

/// generated route for
/// [_i6.ChooseTheme]
class ChooseTheme extends _i16.PageRouteInfo<void> {
  const ChooseTheme({List<_i16.PageRouteInfo>? children})
    : super(ChooseTheme.name, initialChildren: children);

  static const String name = 'ChooseTheme';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i6.ChooseTheme();
    },
  );
}

/// generated route for
/// [_i7.CreateAccount]
class CreateAccount extends _i16.PageRouteInfo<void> {
  const CreateAccount({List<_i16.PageRouteInfo>? children})
    : super(CreateAccount.name, initialChildren: children);

  static const String name = 'CreateAccount';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i7.CreateAccount();
    },
  );
}

/// generated route for
/// [_i8.DiseaseDetails]
class DiseaseDetails extends _i16.PageRouteInfo<DiseaseDetailsArgs> {
  DiseaseDetails({
    required _i17.XFile image,
    _i18.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         DiseaseDetails.name,
         args: DiseaseDetailsArgs(image: image, key: key),
         initialChildren: children,
       );

  static const String name = 'DiseaseDetails';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DiseaseDetailsArgs>();
      return _i8.DiseaseDetails(image: args.image, key: args.key);
    },
  );
}

class DiseaseDetailsArgs {
  const DiseaseDetailsArgs({required this.image, this.key});

  final _i17.XFile image;

  final _i18.Key? key;

  @override
  String toString() {
    return 'DiseaseDetailsArgs{image: $image, key: $key}';
  }
}

/// generated route for
/// [_i9.EditProfile]
class EditProfile extends _i16.PageRouteInfo<void> {
  const EditProfile({List<_i16.PageRouteInfo>? children})
    : super(EditProfile.name, initialChildren: children);

  static const String name = 'EditProfile';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.EditProfile();
    },
  );
}

/// generated route for
/// [_i10.Home]
class Home extends _i16.PageRouteInfo<void> {
  const Home({List<_i16.PageRouteInfo>? children})
    : super(Home.name, initialChildren: children);

  static const String name = 'Home';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i10.Home();
    },
  );
}

/// generated route for
/// [_i11.IntelliRecords]
class IntelliRecords extends _i16.PageRouteInfo<void> {
  const IntelliRecords({List<_i16.PageRouteInfo>? children})
    : super(IntelliRecords.name, initialChildren: children);

  static const String name = 'IntelliRecords';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.IntelliRecords();
    },
  );
}

/// generated route for
/// [_i12.ScreeningPage]
class RouteingRoute extends _i16.PageRouteInfo<RouteingRouteArgs> {
  RouteingRoute({
    required _i19.FarmData farm,
    _i18.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         RouteingRoute.name,
         args: RouteingRouteArgs(farm: farm, key: key),
         initialChildren: children,
       );

  static const String name = 'RouteingRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RouteingRouteArgs>();
      return _i12.ScreeningPage(farm: args.farm, key: args.key);
    },
  );
}

class RouteingRouteArgs {
  const RouteingRouteArgs({required this.farm, this.key});

  final _i19.FarmData farm;

  final _i18.Key? key;

  @override
  String toString() {
    return 'RouteingRouteArgs{farm: $farm, key: $key}';
  }
}

/// generated route for
/// [_i13.SelfCheck]
class SelfCheck extends _i16.PageRouteInfo<void> {
  const SelfCheck({List<_i16.PageRouteInfo>? children})
    : super(SelfCheck.name, initialChildren: children);

  static const String name = 'SelfCheck';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i13.SelfCheck();
    },
  );
}

/// generated route for
/// [_i14.Settings]
class Settings extends _i16.PageRouteInfo<void> {
  const Settings({List<_i16.PageRouteInfo>? children})
    : super(Settings.name, initialChildren: children);

  static const String name = 'Settings';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i14.Settings();
    },
  );
}

/// generated route for
/// [_i15.Welcome]
class Welcome extends _i16.PageRouteInfo<void> {
  const Welcome({List<_i16.PageRouteInfo>? children})
    : super(Welcome.name, initialChildren: children);

  static const String name = 'Welcome';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i15.Welcome();
    },
  );
}
