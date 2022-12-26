import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/app/data/products.dart';
import 'package:flutter_task/app/theme/app_color.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
        init: controller,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Products'),
              centerTitle: true,
            ),
            body: RefreshIndicator(
              onRefresh: controller.refreshProduct,
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: GridView.builder(
                  itemCount: controller.productList?.length??6,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0, childAspectRatio: .8),
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          controller.gotoDetails(controller.productList![index]);
                        },
                        child: Container(
                          width: 150.w,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              controller.productList?[index].image == null? const CircularProgressIndicator():Image.network(
                                controller.productList?[index].image ?? "",
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  Colors.black.withOpacity(.1),
                                  Colors.black.withOpacity(.5),
                                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(10.r),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.productList?[index].title ?? "",
                                        style: Get.textTheme.headline3!.copyWith(color: AppColor.White),
                                        maxLines: 2,
                                      ),
                                      5.verticalSpace,
                                      Text(
                                        "Price: ${controller.productList?[index].price??""}\$",
                                        style: Get.textTheme.bodyText2!.copyWith(color: AppColor.White),
                                      ),
                                      5.verticalSpace,
                                      RatingBar.builder(
                                        initialRating: controller.productList?[index].rating?.rate?.toDouble()??0.0,
                                        minRating: 0,
                                        direction: Axis.horizontal,
                                        itemCount: 5,
                                        itemSize: 15.r,
                                        ignoreGestures: true,
                                        unratedColor: AppColor.Grey,
                                        itemPadding: EdgeInsets.only(right: 5.0.r),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          );
        });
  }
}
