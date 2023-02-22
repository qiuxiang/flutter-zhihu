import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    Widget map(Item item) {
      return NavItem(item, item == active, onChanged);
    }

    final children = items.map(map).toList();
    children.insert(2, const CentralNavItem());
    return ScaffoldPage(
      body: active.widget,
      bottom: BottomAppBar(
        shape: CustomNotchedShape(context),
        child: SizedBox(height: 54, child: Row(children: children)),
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

class CentralNavItem extends StatelessWidget {
  const CentralNavItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: 52,
      height: 52,
      child: Transform.translate(
        offset: const Offset(0, -6),
        child: FloatingActionButton(
          backgroundColor: context.colorScheme.primary,
          elevation: 0,
          onPressed: () {},
          shape: const CircleBorder(),
          child: const Icon(Icons.add_rounded, color: Colors.white, size: 32),
        ),
      ),
    );
  }
}

class CustomNotchedShape extends NotchedShape {
  final BuildContext context;
  const CustomNotchedShape(this.context);

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    const radius = 40.0;
    const lx = 20.0;
    const ly = 4;
    const bx = 12.0;
    const by = 16.0;
    var x = (MediaQuery.of(context).size.width - radius) / 2 - lx;
    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(x, host.top)
      ..quadraticBezierTo(x + bx, host.top, x += lx, host.top - ly)
      ..quadraticBezierTo(
          x + radius / 2, host.top - by, x += radius, host.top - ly)
      ..quadraticBezierTo((x += lx) - bx, host.top, x, host.top)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom);
  }
}
