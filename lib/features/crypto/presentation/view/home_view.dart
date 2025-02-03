import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crypto_app/features/crypto/presentation/view/widgets/add_assets_dialog.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: CircleAvatar(
        backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.dialog(AddAssetsDialog());
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
