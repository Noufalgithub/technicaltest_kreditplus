import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:technicaltest_kreditplus/app/data/models/model_products.dart';
import 'package:technicaltest_kreditplus/app/modules/home/views/widgets/card_product_landscape.dart';
import 'package:technicaltest_kreditplus/app/modules/home/views/widgets/card_product_potrait.dart';
import 'package:technicaltest_kreditplus/app/utils/enum.dart';
import 'package:technicaltest_kreditplus/app/utils/responsive.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Responsive(
        mobile: Obx(() {
          if (controller.loadingState.value == LoadingState.loading) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (controller.loadingState.value == LoadingState.empty) {
            return Center(
              child: Text('Data Kosong'),
            );
          } else {
            return SmartRefresher(
              controller: controller.refreshController.value,
              enablePullUp: true,
              enablePullDown: false,
              onLoading: controller.onLoading,
              child: ListView.builder(
                  itemCount: controller.limit.value,
                  itemBuilder: ((context, index) => CardProductLandscape(
                        image: '${controller.modelProducts[index].image}',
                        rate: '${controller.modelProducts[index].rating!.rate}',
                        title: '${controller.modelProducts[index].title}',
                        desc: '${controller.modelProducts[index].description}',
                        price: '${controller.modelProducts[index].price}',
                      ))),
            );
          }
        }),
        // tablet: Obx(() {
        //   if (controller.loadingState.value == LoadingState.loading) {
        //     return Center(
        //       child: CircularProgressIndicator.adaptive(),
        //     );
        //   } else if (controller.loadingState.value == LoadingState.empty) {
        //     return Center(
        //       child: Text('Data Kosong'),
        //     );
        //   } else {
        //     return SmartRefresher(
        //       controller: controller.refreshController.value,
        //       enablePullUp: true,
        //       enablePullDown: false,
        //       onLoading: controller.onLoading,
        //       child: ListView.builder(
        //           itemCount: controller.limit.value,
        //           itemBuilder: ((context, index) => CardProductLandscape(
        //             image: '${controller.modelProducts[index].image}',
        //             rate: '${controller.modelProducts[index].rating!.rate}',
        //             title: '${controller.modelProducts[index].title}',
        //             desc: '${controller.modelProducts[index].description}',
        //             price: '${controller.modelProducts[index].price}',
        //           ))),
        //     );
        //   }
        // }),
        desktop: Obx(() {
          if (controller.loadingState.value == LoadingState.loading) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (controller.loadingState.value == LoadingState.empty) {
            return Center(
              child: Text('Data Kosong'),
            );
          } else {
            return SmartRefresher(
              controller: controller.refreshController.value,
              enablePullUp: true,
              enablePullDown: false,
              onLoading: controller.onLoading,
              child: GridView.builder(
                  itemCount: controller.limit.value,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 20,
                      childAspectRatio: Get.width > 1330 ? 0.7 : 0.6),
                  itemBuilder: (context, index) => CardProductPotrait(
                        image: '${controller.modelProducts[index].image}',
                        rate: '${controller.modelProducts[index].rating!.rate}',
                        title: '${controller.modelProducts[index].title}',
                        desc: '${controller.modelProducts[index].description}',
                        price: '${controller.modelProducts[index].price}',
                      )),
            );
          }
        }),
      ),
    );
  }
}
