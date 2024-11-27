import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/theme/theme.dart';

import '../../../utils/common_appBar.dart';
import '../controllers/pdf_viewer_controller.dart';

class PdfViewerView extends GetView<PdfViewerController> {
  const PdfViewerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surface,
      appBar: CommonAppBar(
        title: controller.title,
        hasBackIcon: true,
        bgColor: Colors.transparent,
        isTitleCenter: true,
      ),
      body: PDFView(
        backgroundColor: surface,
        filePath: controller.filePath,
      ),
    );
  }
}
