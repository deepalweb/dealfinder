import 'package:get/get.dart';
import '../mocks/deals.dart';

class DealController extends GetxController {
  var deals = <Deal>[].obs;
  var filteredDeals = <Deal>[].obs;
  var savedDeals = <Deal>[].obs;

  @override
  void onInit() {
    deals.addAll(mockDeals);
    filteredDeals.addAll(mockDeals);
    super.onInit();
  }

  void filterByCategory(String category) {
    if (category == "All") {
      filteredDeals.assignAll(deals);
    } else {
      filteredDeals.assignAll(deals.where((deal) => deal.category == category));
    }
  }

  void toggleSaveDeal(Deal deal) {
    if (savedDeals.contains(deal)) {
      savedDeals.remove(deal);
    } else {
      savedDeals.add(deal);
    }
  }
}