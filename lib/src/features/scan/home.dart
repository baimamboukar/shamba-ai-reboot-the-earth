import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:iconly/iconly.dart';
import 'package:shamba/src/extensions/build_context.dart';
import 'package:shamba/src/router/intellibra_router.gr.dart' as routes;

@RoutePage()
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsScaffold(
        routes: const [
          routes.SelfCheck(),
          routes.IntelliRecords(),
          routes.Awareness(),
          routes.Settings(),
        ],
        floatingActionButtonBuilder: (context, router) {
          if (router.activeIndex == 0 && router.activeIndex != 0) {
            return FloatingActionButton(
              onPressed: () {},
              child: const HeroIcon(HeroIcons.sparkles),
            );
          }
          return null;
        },
        transitionBuilder: (context, child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        bottomNavigationBuilder: (context, router) {
          return NavigationBar(
            indicatorColor: context.scheme.primary.withOpacity(.25),
            //  backgroundColor: context.scheme.primary,
            destinations: const [
              NavigationDestination(
                icon: HeroIcon(HeroIcons.rectangleGroup),
                label: 'Saphir',
              ),
              NavigationDestination(
                icon: HeroIcon(HeroIcons.sparkles),
                label: 'Alora',
              ),
              NavigationDestination(
                icon: HeroIcon(HeroIcons.viewfinderCircle),
                label: 'Disease',
              ),
              NavigationDestination(
                icon: HeroIcon(HeroIcons.squares2x2),
                label: 'More',
              ),
            ],
            selectedIndex: router.activeIndex,
            onDestinationSelected: (index) => router.setActiveIndex(index),
          );
        },
      ),
    );
  }
}
