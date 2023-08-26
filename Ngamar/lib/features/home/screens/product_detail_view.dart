import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';

import '../../checkout/controller/cart_controller.dart';
import '../../checkout/screens/cart_view.dart';
import '../data/product_model.dart';
import 'widgets/widgets.dart';


class ProductDetailView extends StatefulWidget {
  final ProductModel product;
  const ProductDetailView({
    required this.product,
    super.key,
  });

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int _selectedColor = 0;
  int selectedQuantity = 1;
  CartController cc = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: AppColors.kWhite,
        ),
        centerTitle: true,
        title: Text(
          'Detail',
          style: AppTypography.kSemiBold18.copyWith(color: AppColors.kWhite),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to<Widget>(CartView.new);
            },
            icon: SvgPicture.asset(
              AppAssets.kBag,
              colorFilter:
                  const ColorFilter.mode(AppColors.kWhite, BlendMode.srcIn),
            ),
          ),
          SizedBox(width: AppSpacing.tenHorizontal),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Hero(
              tag: widget.product.id,
              child: Container(
                height: 280.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSpacing.thirtyVertical),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.r),
                ),
                color: AppColors.kWhite,
              ),
              margin: EdgeInsets.only(top: 250.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: AppTypography.kSemiBold18,
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.kStar),
                              SizedBox(width: 5.w),
                              Text(
                                widget.product.averageRatings.toString(),
                                style: AppTypography.kSemiBold14,
                              ),
                              Text(
                                '(${widget.product.totalRatings} Review)',
                                style: AppTypography.kSemiBold12
                                    .copyWith(color: AppColors.kGrey60),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          QuantityCard(
                            onChanged: (quantity) {
                              setState(() {
                                selectedQuantity = quantity;
                                debugPrint(selectedQuantity.toString());
                              });
                            },
                          ),
                          Text(
                            'Available in stock',
                            style: AppTypography.kSemiBold12.copyWith(
                              color: AppColors.kGrey100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.twentyVertical),
                  Text(
                    'Color',
                    style: AppTypography.kSemiBold18,
                  ),
                  SizedBox(height: AppSpacing.tenVertical),
                  Wrap(
                    spacing: 10.w,
                    runSpacing: 10.0.h,
                    children: List.generate(
                      availableColor.length,
                      (index) => ColorCard(
                        color: availableColor[index],
                        isSelected: _selectedColor == index,
                        onTap: () {
                          setState(() {
                            _selectedColor = index;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.twentyVertical),
                  Text(
                    'Description',
                    style: AppTypography.kSemiBold18,
                  ),
                  SizedBox(height: AppSpacing.tenVertical),
                  ExpandableText(
                    widget.product.description,
                    expandText: 'Read More',
                    collapseText: 'Read Less',
                    maxLines: 3,
                    linkColor: AppColors.kPrimary,
                    style: AppTypography.kMedium14.copyWith(
                      color: AppColors.kGrey80,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: AppColors.kWhite,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10.h),
        child: Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: r'$',
                  style:
                      AppTypography.kBold24.copyWith(color: AppColors.kPrimary),
                  children: [
                    TextSpan(
                      text: widget.product.currentPrice.toString(),
                      style: AppTypography.kBold24,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PrimaryButton(
                onTap: () {
                  cc.addToCart(widget.product, selectedQuantity);
                },
                text: 'Add To Cart',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
