import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class ReservationView extends GetView<DashboardController>  {
  const ReservationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReservationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReservationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
