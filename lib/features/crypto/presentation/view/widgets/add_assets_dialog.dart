import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crypto_app/features/crypto/presentation/view_model/assets_view_model.dart';
import 'package:getx_crypto_app/features/crypto/presentation/view_model/add_asset_view_model.dart';

class AddAssetsDialog extends StatelessWidget {
  final AddAssetViewModel addAssetViewModel = Get.put(AddAssetViewModel());

  AddAssetsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: Material(
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.40,
            width: MediaQuery.sizeOf(context).width * 0.80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: addAssetViewModel.loading.value
                ? Center(
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DropdownButton(
                          value: addAssetViewModel.selectedAsset.value,
                          items: addAssetViewModel.assetsList.map(
                            (coin) {
                              print(addAssetViewModel.selectedAsset.value);
                              return DropdownMenuItem<String>(
                                value: coin,
                                child: Text(coin),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              addAssetViewModel.selectedAsset.value = value;
                            }
                          },
                        ),
                        TextField(
                          onChanged: (value) {
                            addAssetViewModel.assetValue.value =
                                double.parse(value);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            final AssetsViewModel assetsController =
                                Get.put(AssetsViewModel());

                            assetsController.addTrackedAsset(
                              addAssetViewModel.selectedAsset.value,
                              addAssetViewModel.assetValue.value,
                            );
                            Get.back(closeOverlays: true);
                          },
                          color: Theme.of(context).colorScheme.primary,
                          child: Text(
                            "Add Asset",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
