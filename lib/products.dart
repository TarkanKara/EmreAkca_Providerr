import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/basket.dart';
import 'package:providerproject/item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, Item item, widget) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Sepetteki Ürün | ${item.basket!.length} |"),
          actions: [
            InkWell(
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => BasketScreen())));
              }),
              child: Container(
                width: 5.h,
                margin: EdgeInsets.only(
                    left: 3.w, right: 3.w, top: 2.w, bottom: 2.w),
                child: Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.w)),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 80.h,
              width: 100.w,
              child: ListView.builder(
                itemCount: item.products!.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100.w,
                    height: 8.h,
                    margin: EdgeInsets.only(bottom: 1.h),
                    padding: EdgeInsets.only(right: 3.w, left: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(4.w),
                                child: SizedBox(
                                  width: 7.h,
                                  height: 7.h,
                                  child: Image.network(
                                      "${item.products![index]["image"]}"),
                                )),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "${item.products![index]["title"]}",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            item.addBasket(item.products![index]);
                          },
                          child: Container(
                            width: 4.h,
                            height: 4.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(.7.h)),
                            child: Icon(Icons.add_shopping_cart_rounded),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
