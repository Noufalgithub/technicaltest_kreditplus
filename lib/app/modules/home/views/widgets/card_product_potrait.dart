import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardProductPotrait extends StatelessWidget {
  const CardProductPotrait({
    Key? key, required this.image, required this.rate, required this.title, required this.desc, required this.price,
  }) : super(key: key);

  final String image;
  final String rate;
  final String title;
  final String desc;
  final String price;

  @override
  Widget build(BuildContext context) {
    // double _size = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      // width: (Get.width >= 1100) ? Get.width * 0.12 : Get.width * 0.1,
      // height: (Get.height >= 1100) ? Get.height * 0.18 : Get.height * 0.16,
      // width: Get.width * 0.05,
      // height: Get.height * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                height: Get.width > 1200 ? Get.height * 0.15 : Get.height * 0.12,
                decoration: BoxDecoration(
                  // color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          '$image')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(36)),
                  child: Text(
                    '\$' + '$price',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '$title',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$desc',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize:  9),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size:  9,
                        ),
                        Text(
                          '$rate',
                          style: TextStyle(
                              fontSize:  9,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}