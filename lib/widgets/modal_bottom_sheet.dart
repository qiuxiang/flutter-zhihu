import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalBottomSheet extends StatelessWidget {
  final String title;
  final List<Widget> slivers;

  ModalBottomSheet(this.title, this.slivers);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      builder: (_, controller) {
        return NestedScrollView(
          headerSliverBuilder: (_, __) => [
            SliverPadding(
              padding: EdgeInsets.all(Get.mediaQuery.padding.top / 2),
            ),
          ],
          body: Material(
            color: Colors.white,
            child: CustomScrollView(controller: controller, slivers: [
              SliverAppBar(
                pinned: true,
                title: Text(title),
                backwardsCompatibility: false,
                elevation: 0.5,
                leading: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: Get.back,
                ),
              ),
              ...slivers,
            ]),
          ),
        );
      },
    );
  }
}