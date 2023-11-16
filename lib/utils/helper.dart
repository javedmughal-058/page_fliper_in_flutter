import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_assets.dart';

class OptionsDrawer extends StatelessWidget {
  const OptionsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer();
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key, required this.prompt}) : super(key: key);
  final String prompt;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Row(
        children: [
          Text(prompt, style: Theme.of(context).textTheme.titleLarge),
          const Spacer(),
          SvgPicture.asset(
            AppAssets.profileIcon,
            semanticsLabel: 'Profile',
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}

class BottomFlipIconButton extends StatelessWidget {
  const BottomFlipIconButton({Key? key, this.onFlip}) : super(key: key);
  final VoidCallback? onFlip;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onFlip,
          icon: const Icon(Icons.flip),
        )
      ],
    );
  }
}