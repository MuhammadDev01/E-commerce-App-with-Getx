import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_with_mvc/logic/controller/cart_controller.dart';
import 'package:ecommerce_with_mvc/routes/routes.dart';
import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:ecommerce_with_mvc/views/widgets/home/productDetails/color_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:badges/badges.dart' as badges;

class ImageSliderWidget extends StatefulWidget {
  const ImageSliderWidget({
    super.key,
    required this.imageProduct,
  });
  final String imageProduct;

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  int activeIndex = 0;
  var cartController = Get.find<CartController>();
  int currentColor = 0;
  final colorsPickerList = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor2,
    kCOlor3,
    kCOlor4,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 500,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
          itemCount: 3,
          itemBuilder: (context, index, realIndex) => ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              widget.imageProduct,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 150,
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
              dotHeight: 10,
              dotWidth: 10,
              spacing: 5,
              expansionFactor: 4,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          currentColor = index;
                        });
                      },
                      child: ColorPickerWidget(
                          outerOrder: currentColor == index,
                          color: colorsPickerList[index]),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 3,
                    ),
                itemCount: colorsPickerList.length),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Get.isDarkMode
                    ? pinkClr.withOpacity(0.5)
                    : mainColor.withOpacity(0.5),
                child: IconButton(
                  padding: const EdgeInsets.only(left: 8),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Obx(
                () => badges.Badge(
                  position: badges.BadgePosition.topEnd(end: -10, top: -10),
                  badgeContent: Text(cartController.quantity().toString()),
                  badgeStyle: badges.BadgeStyle(
                    badgeColor:
                        Get.isDarkMode ? pinkClr.withOpacity(0.7) : pinkClr,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Get.isDarkMode
                        ? pinkClr.withOpacity(0.5)
                        : mainColor.withOpacity(0.5),
                    child: IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                      ),
                      onPressed: () {
                        Get.offNamed(Routes.cardItemsPage);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
