import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:num_mad3/screens/setting_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: Container(color: Colors.amber),
            item: ItemConfig(
              icon: Icon(Icons.home),
              title: "Home",
              activeForegroundColor: Theme.of(context).colorScheme.onPrimary,
              inactiveForegroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          PersistentTabConfig(
            screen: Container(color: Colors.blue),
            item: ItemConfig(
              icon: Icon(Icons.message),
              title: "Messages",
              activeForegroundColor: Theme.of(context).colorScheme.onPrimary,
              inactiveForegroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          PersistentTabConfig(
            screen: SettingScreen(),
            item: ItemConfig(
              icon: Icon(Icons.settings),
              title: "Settings",
              activeForegroundColor: Theme.of(context).colorScheme.onPrimary,
              inactiveForegroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            color:Theme.of(context).colorScheme.secondary,
          ),
        ),
    );
  }
}