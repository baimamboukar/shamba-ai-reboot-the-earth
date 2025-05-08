import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamba/bootstrap.dart';
import 'package:shamba/src/app/app.dart';
import 'package:shamba/src/features/onboarding/thememode/cubit/theme_cubit.dart';

void main() {
  bootstrap(
    () => BlocProvider(
      create: (context) => ThemeCubit(),
      child: const Intellibra(),
    ),
  );
}
