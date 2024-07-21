import 'package:ecommerce_with_mvc/logic/controller/cart_controller.dart';
import 'package:ecommerce_with_mvc/logic/controller/products_controller.dart';
import 'package:ecommerce_with_mvc/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItemBuilder extends StatefulWidget {
  const CardItemBuilder({
    super.key,
    required this.model,
    required this.productId,
    required this.index,
    required this.onTap,
  });

  final ProductsModel model;
  final int productId;
  final int index;
  final Function() onTap;
  @override
  State<CardItemBuilder> createState() => _CardItemBuilderState();
}

class _CardItemBuilderState extends State<CardItemBuilder> {
  var cartController = Get.find<CartController>();
  var productController = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>  InkWell(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5.0,
                spreadRadius: 3.0,
              ),
            ],
          ),
          child: Stack(
            alignment: const Alignment(0, 0.9),
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    bottom: 8.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              productController
                                  .manageFavoriteList(widget.productId);
                            },
                            icon:
                                productController.addToFavorite(widget.productId)
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_outline,
                                        color: Colors.black,
                                      ),
                          ),
                          Expanded(
                            child: Text(
                              widget.model.title,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  Theme.of(context).textTheme.bodySmall!.copyWith(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              cartController.addProductToCart(
                                  productController.productList[widget.index]);
                            },
                            icon: const Icon(
                              Icons.add_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            widget.model.image,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 20,
                width: 150,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(0.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "\$${widget.model.price.toString()}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "|",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.model.rating.rate.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                    ),
                    const Icon(
                      Icons.star,
                      size: 14,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
