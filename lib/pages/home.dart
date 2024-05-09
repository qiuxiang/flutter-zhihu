import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils.dart';
import '../widgets/scaffold_page.dart';
import 'recommends/recommends.dart';

class Item {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final Widget widget;

  const Item(this.label, this.icon, this.activeIcon, this.widget);
}

const items = [
  Item('首页', Icons.home_outlined, Icons.home, RecommendsPage()),
  Item('关注', Icons.person_add_outlined, Icons.person_add, SizedBox()),
  Item(
    '会员',
    Icons.workspace_premium_outlined,
    Icons.workspace_premium,
    SizedBox(),
  ),
  Item(
    '我的',
    Icons.sentiment_satisfied,
    Icons.sentiment_satisfied_outlined,
    SizedBox(),
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Item active = items[0];

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarItem map(Item item) {
      return BottomNavigationBarItem(
        icon: Icon(item == active ? item.activeIcon : item.icon),
        label: item.label,
      );
    }

    final children = items.map(map).toList();
    return ScaffoldPage(
      body: active.widget,
      bottom: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: items.indexOf(active),
        unselectedItemColor: context.theme.colorScheme.secondary,
        selectedItemColor: context.theme.colorScheme.primary,
        selectedFontSize: 12,
        items: children,
        onTap: (i) => onChanged(items[i]),
      ),
    );
  }

  void onChanged(Item item) {
    setState(() => active = item);
  }
}

class NavItem extends StatelessWidget {
  final Item item;
  final bool active;
  final void Function(Item) onPressed;

  // ignore: avoid_positional_boolean_parameters
  const NavItem(this.item, this.active, this.onPressed);

  @override
  Widget build(BuildContext context) {
    final color =
        active ? context.colorScheme.primary : context.colorScheme.secondary;
    return Expanded(
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => onPressed(item),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            active ? item.activeIcon : item.icon,
            color: color,
            size: 28,
          ),
          Text(
            item.label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ]),
      ),
    );
  }
}
