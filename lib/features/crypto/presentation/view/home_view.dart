import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crypto_app/features/crypto/domain/models/tracked_coins_model.dart';
import 'package:getx_crypto_app/features/crypto/presentation/view_model/assets_view_model.dart';
import 'package:getx_crypto_app/features/crypto/presentation/view/widgets/add_assets_dialog.dart';

class HomeView extends StatelessWidget {
  final AssetsViewModel assetsViewModel = Get.put(AssetsViewModel());

  HomeView({super.key});

  Widget _portfolioValue(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.05,
      ),
      child: Center(
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              TextSpan(
                text: "\$",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text:
                    "${assetsViewModel.getPortfolioValue().toStringAsFixed(2)}\n",
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: "Portfolio Value",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _trackedAssetsList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            child: Text(
              "Portfolio",
              style: TextStyle(
                fontSize: 10,
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: assetsViewModel.trackedAssets.length,
              itemBuilder: (context, index) {
                TrackedAssetsModel trackedAssetsModel =
                    assetsViewModel.trackedAssets[index];

                return ListTile(
                  leading: CircleAvatar(
                    child: Image.network(
                      assetsViewModel
                          .getCurrenciesIcons(trackedAssetsModel.name!),
                    ),
                  ),
                  title: Text(trackedAssetsModel.name!),
                  subtitle: Text(
                      "USD: ${assetsViewModel.getAssetPrice(trackedAssetsModel.name!).toStringAsFixed(2)}"),
                  trailing: Text(
                    trackedAssetsModel.amount.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                _portfolioValue(context),
                _trackedAssetsList(context),
              ],
            ),
          ),
        ),
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
