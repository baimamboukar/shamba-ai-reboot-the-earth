import 'package:action_slider/action_slider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shamba/src/common/common.dart';
import 'package:shamba/src/extensions/build_context.dart';
import 'package:shamba/src/extensions/num.dart';
import 'package:shamba/src/features/onboarding/thememode/cubit/theme_cubit.dart';

///TODO: #32 Redesign welcome page to give a new feel
///TODO: #33 add onboarding slider on welcome page
@RoutePage()
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (BuildContext context, bool state) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      context.scheme.primary.withOpacity(.7),
                      context.scheme.primary.withOpacity(.2),
                    ],
                  ),
                  // image: const DecorationImage(
                  //   image: AssetImage(Assets.assetsIconsAppIcon),
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      colors: [
                        context.scheme.primary.withOpacity(.7),
                        context.scheme.primary.withOpacity(.8),
                        context.scheme.primary.withOpacity(.9),
                        context.scheme.primary.withOpacity(1),
                      ],
                    ),
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'Shamba AI',
                        style: context.theme.textTheme.displayLarge!.copyWith(
                          color: context.scheme.onPrimary,
                        ),
                      ),
                      Text(
                        'Make agriculture easy and profitable',
                        style: context.theme.textTheme.bodyMedium!.copyWith(
                          color: context.scheme.onPrimary,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      IntellibraButton(
                        text: '',
                        color: context.scheme.primary,
                        action: () {
                          context.router.pushPath('/home');
                        },
                      ),
                      const DeviceSwitch(),
                      34.vGap,
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DeviceSwitch extends StatelessWidget {
  const DeviceSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionSlider.standard(
      boxShadow: const [],
      height: 84,
      width: context.width * .8,
      icon: Container(
        height: 84,
        width: context.width * .8,
        decoration: BoxDecoration(
          color: context.scheme.primary,
          shape: BoxShape.circle,
        ),
        child: HeroIcon(
          HeroIcons.sparkles,
          size: 22,
          color: context.scheme.onPrimary,
        ),
      ),
      customBackgroundBuilder: (context, state, child) {
        return GlassContainer.frostedGlass(
          height: 78,
          width: context.width * .75,
          borderWidth: 0,
          borderColor: context.scheme.primaryContainer,
          borderRadius: BorderRadius.circular(58),
          blur: 12,
          child: child,
        );
      },
      sliderBehavior: SliderBehavior.stretch,
      customBackgroundBuilderChild: Padding(
        padding: const EdgeInsets.only(left: 74),
        child: Row(
          children: [
            const Text('Get Started'),
            const Spacer(),
            for (var i = 0; i < 3; i++)
              HeroIcon(
                HeroIcons.chevronRight,
                size: 20,
                color: context.scheme.primary,
              ),
          ],
        ),
      ),
      action: (controller) async {
        controller.loading();
        await Future<void>.delayed(const Duration(seconds: 1));
        controller.success();
        await Future<void>.delayed(const Duration(milliseconds: 450));
        if (context.mounted) {
          await context.router.pushPath('/home');
        }
      },
    );
  }
}
