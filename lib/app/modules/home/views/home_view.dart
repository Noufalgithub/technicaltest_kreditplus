import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicaltest_kreditplus/app/modules/home/views/widgets/card_product_landscape.dart';
import 'package:technicaltest_kreditplus/app/modules/home/views/widgets/card_product_potrait.dart';
import 'package:technicaltest_kreditplus/app/utils/responsive.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    print(Get.width);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Products'),
      //   centerTitle: true,
      // ),
      body: Responsive(
        mobile: ListView.builder(
            itemCount: 4,
            itemBuilder: ((context, index) => CardProductLandscape(
                  image:
                      'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
                  rate: '4.5',
                  title: 'Mens Casual Premium Slim Fit T-Shirts',
                  desc:
                      'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.',
                  price: '22.3',
                ))),
        tablet: ListView.builder(
            itemCount: 4,
            itemBuilder: ((context, index) => CardProductLandscape(
              image:
              'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
              rate: '4.5',
              title: 'Mens Casual Premium Slim Fit T-Shirts',
              desc:
              'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.',
              price: '22.3',
            ))),
        desktop: GridView.builder(
            itemCount: 16,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8, crossAxisSpacing: 5, childAspectRatio: Get.width > 1330 ? 0.7 : 0.6),
            itemBuilder: (context, index) => CardProductPotrait(
                  image:
                      'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
                  price: '195.50',
                  title: 'Mens Casual Premium Slim Fit T-Shirts',
                  desc:
                      'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.',
                  rate: '4.5',
                )),
      ),
    );
  }
}
