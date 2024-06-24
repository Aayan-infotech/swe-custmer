import 'package:get/get.dart';
import 'package:southwaltoncarts_customer/app/model/single_select_item_model.dart';
import 'package:southwaltoncarts_customer/app/utils/strings.dart';

class AddressController extends GetxController {

  var isModify = false.obs;

  var statusList  = [
    SingleSelectItemModel(title: Strings.confirmed, isSelected: true.obs),
    SingleSelectItemModel(title: Strings.notConfirmed, isSelected: false.obs),
    SingleSelectItemModel(title: Strings.completed, isSelected: false.obs)
].obs;

}
