import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../theme/app_color.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
        init: controller,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Product Details'),
              centerTitle: true,
            ),
            body: controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.verticalSpace,
                        Center(
                          child: Image.network(controller.product?.image??"",height: 300.r,width: 300.r,),
                        ),
                        30.verticalSpace,
                        Text(
                          controller.product?.title ?? "",
                          style: Get.textTheme.headline2!.copyWith(color: AppColor.Primary),
                        ),
                        5.verticalSpace,
                        Text(
                          "Price: ${controller.product?.price}\$",
                          style: Get.textTheme.headline2,
                        ),
                        5.verticalSpace,
                        RatingBar.builder(
                          initialRating: controller.product?.rating?.rate?.toDouble()??0.0,
                          minRating: 0,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 20.r,
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
                        20.verticalSpace,
                        Text(
                          "Description",
                          style: Get.textTheme.headline2,
                        ),
                        5.verticalSpace,
                        Text(
                          controller.product?.description??"",
                          style: Get.textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
          );
        });
  }
}
