import 'package:ecommerce_with_mvc/logic/controller/products_controller.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({
    super.key,
    required this.titleProduct,
    required this.ratingProduct,
    required this.descProduct,
    required this.idProduct,
  });
  final String titleProduct;
  final double ratingProduct;
  final String descProduct;
  final int idProduct;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  titleProduct,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GetBuilder<ProductsController>(
                builder: (controller) => CircleAvatar(
                  backgroundColor: Get.isDarkMode ? Colors.white : Colors.grey,
                  radius: 16,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 18,
                    onPressed: () {
                      controller.manageFavoriteList(idProduct);
                    },
                    icon: controller.addToFavorite(idProduct)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.black,
                          ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                ratingProduct.toString(),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                    ),
              ),
              const SizedBox(
                width: 5,
              ),
              RatingBar.builder(
                initialRating: ratingProduct,
                minRating: 1,
                itemSize: 16,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ReadMoreText(
            descProduct,
            trimMode: TrimMode.Line,
            trimLines: 3,
            trimCollapsedText: "Show More",
            trimExpandedText: "Show Less",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            style: TextStyle(
              height: 1.5,
              fontSize: 14,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontFamily: fontQuicksand,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
