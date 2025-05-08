import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamba/bootstrap.dart';
import 'package:shamba/src/app/app.dart';
import 'package:shamba/src/features/onboarding/thememode/cubit/theme_cubit.dart';

void main() {
  bootstrap(
    () => MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: ThemeCubit(),
        ),
        // BlocProvider.value(value: ScanCubit()),
      ],
      child: const Intellibra(),
    ),
  );
}
