import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class HistoryView extends GetView<DashboardController>  {
  const HistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}