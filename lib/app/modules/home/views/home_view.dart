import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicaltest_kreditplus/app/modules/home/views/widgets/list_card_product_horizontal.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: ((context, index) => ListCardProductHorizontal(
              image: 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
              rate: '4.5',
              title: 'Mens Casual Premium Slim Fit T-Shirts',
              desc:
                  'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.',
              price: '22.3',
            )),
      ),
    );
  }
}
