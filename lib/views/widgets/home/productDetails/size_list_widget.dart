import 'package:ecommerce_with_mvc/utils/theme.dart';
import 'package:flutter/material.dart';

class SizeListWidget extends StatefulWidget {
  const SizeListWidget({super.key});

  @override
  State<SizeListWidget> createState() => _SizeListWidgetState();
}

class _SizeListWidgetState extends State<SizeListWidget> {
  final List<String> sizeList = const ['S', 'M', 'L', 'XL', 'XXL'];
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              isSelected = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected == index
                  ? mainColor.withOpacity(0.5)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Text(
                sizeList[index],
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 14,
                    ),
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 5,
        ),
        itemCount: sizeList.length,
      ),
    );
  }
}
