import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:iconly/iconly.dart';
import 'package:shamba/src/app/assets.dart';
import 'package:shamba/src/common/common.dart';
import 'package:shamba/src/common/widgets/intellibra_button.dart';
import 'package:shamba/src/configs/intellibra_pathname.dart';
import 'package:shamba/src/extensions/build_context.dart';
import 'package:shamba/src/extensions/num.dart';
import 'package:shamba/src/features/settings/widgets/action_tile.dart';

@RoutePage()
class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            34.vGap,
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(Assets.assetsIconsUser),
                radius: 50,
              ),
            ),
            4.vGap,
            ProfileCard(
              children: [
                Text(
                  'Nguela Landon',
                  style: context.theme.textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '+2506754347629',
                  style: context.theme.textTheme.bodyLarge,
                ),
                14.vGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IntellibraFlexibleButton(
                      text: 'Edit Profile',
                      color: context.scheme.primary.withOpacity(0.5),
                      icon: IconlyBroken.edit,
                      buttonRadius: 32,
                      action: () {},
                    ),
                    8.hGap,
                    IntellibraFlexibleButton(
                      text: 'Sign Out',
                      icon: IconlyBroken.logout,
                      color: context.scheme.primary.withOpacity(0.5),
                      buttonRadius: 32,
                      action: () {},
                    ),
                  ],
                ),
              ],
            ),
            14.vGap,
            ProfileCard(
              children: [
                Text(
                  'Saphir Member Since',
                  style: context.theme.textTheme.titleSmall,
                ),
                Text(
                  'Feb 25, 2024',
                  style: context.theme.textTheme.bodyLarge,
                ),
              ],
            ),
            ProfileCard(
              children: [
                Text(
                  'Intellibra Settings',
                  style: context.theme.textTheme.titleSmall,
                ),
                4.vGap,
                ActionLabelWithDivider(
                  label: 'Account',
                  icon: IconlyBroken.profile,
                  onTap: () =>
                      context.router.pushPath(PathName.accountSettings),
                ),
                ActionLabelWithDivider(
                  icon: Hicons.card1Bold,
                  label: 'Billing',
                  onTap: () =>
                      context.router.pushPath(PathName.billingSettings),
                ),
                ActionLabel(
                  icon: Icons.phone_iphone,
                  label: 'App',
                  onTap: () => context.router.pushPath(PathName.appSettings),
                ),
              ],
            ),
            /* const Center(
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            34.vGap,
            Center(
              child: Image.asset(
                Assets.assetsIconsWoman,
                height: 100,
              ),
            ),
            4.vGap,
            Center(
              child: Text(
                'Lady Bug Miraculous',
                style: context.theme.textTheme.bodyLarge,
              ),
            ),
            14.vGap,
            const IntellibraButton(
              text: 'Edit Profile',
            ),
            34.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Intellibra actions',
                    style: context.theme.textTheme.bodyMedium,
                  ),
                ),
                4.hGap,
                const Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            ActionLabel(
              label: 'Intellibra scans',
              onTap: () {},
              icon: IconlyBroken.heart,
            ),
            ActionLabel(
              icon: Hicons.lock_1_bold,
              label: 'Pin code',
              onTap: () {},
            ),
            ActionLabel(
              icon: Icons.language,
              label: "Langue de l'application",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const IntelliDialog(),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Usage',
                    style: context.theme.textTheme.bodyMedium,
                  ),
                ),
                4.hGap,
                const Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            ActionLabel(
              icon: IconlyBroken.work,
              label: 'Temrs & Conditions',
              onTap: () {
                context.router.pushPath('/home');
              },
            ),
            ActionLabel(
              icon: Hicons.information_square_bold,
              label: 'Infos',
              onTap: () {
                context.router.pushPath('/home');
              },
            ), */
            34.vGap,
            // const TradeMark(),
            // 8.vGap,
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    required this.children,
    super.key,
  });
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.scheme.onPrimary,
          borderRadius: BorderRadius.circular(16),
          /*  boxShadow: [
            BoxShadow(
              color: context.scheme.primary.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ], */
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
