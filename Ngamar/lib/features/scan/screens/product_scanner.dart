import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/scan/screens/widgets/qr_scanner_overlay_shape.dart';
import 'package:ngamar/features/scan/screens/widgets/scanned_product.dart';

import '../../home/data/product_model.dart';
import '../../landingPage/screens/landing_page.dart';

class ProductScanner extends StatefulWidget {
  const ProductScanner({Key? key}) : super(key: key);

  @override
  _ProductScannerState createState() => _ProductScannerState();
}

class _ProductScannerState extends State<ProductScanner>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll<Widget>(() => const LandingPage());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAll<Widget>(() => const LandingPage());
            },
          ),
          title: Text(
            'Scan Product',
            style:
                AppTypography.kSemiBold16.copyWith(color: AppColors.kGrey100),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: AppSpacing.twentyVertical,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Stack(
                    children: [
                      MobileScanner(
                        controller: MobileScannerController(
                          returnImage: true,
                        ),
                        onDetect: (capture) {
                          final barcodes = capture.barcodes;
                          for (final barcode in barcodes) {
                            debugPrint('Barcode found! ${barcode.rawValue}');
                          }
                        },
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: ShapeDecoration(
                            shape: QrScannerOverlayShape(
                              borderColor: AppColors.kPrimary,
                              borderRadius: 10,
                              borderLength: 20,
                              borderWidth: 5,
                              cutOutSize: 300.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ScannedProduct(
                  product: dummyProductList[0],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
