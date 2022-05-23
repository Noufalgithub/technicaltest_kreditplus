import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:technicaltest_kreditplus/app/data/models/model_products.dart';
import 'package:technicaltest_kreditplus/app/utils/constants.dart';
import 'package:technicaltest_kreditplus/app/utils/enum.dart';

class HomeController extends GetxController {
  Rx<int> limit = 4.obs;
  Rx<LoadingState> loadingState = LoadingState.loading.obs;
  Rx<RefreshController> refreshController =
      RefreshController(initialRefresh: false).obs;
  var modelProducts = List<ModelProducts>.empty().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getPlatform();
    getProducts();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    limit(4);
    refreshController.value = RefreshController(initialRefresh: false);
    super.dispose();
  }

  void onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (limit.value == modelProducts.length) {
    } else {
      if (GetPlatform.isMobile) {
        limit.value += 4;
        if (limit.value >= modelProducts.length) {
          limit.value = modelProducts.length;
        }
      } else if (GetPlatform.isWeb) {
        limit.value += 16;
        if (limit.value >= modelProducts.length) {
          limit.value = modelProducts.length;
        }
      }
    }
    refreshController.value.loadComplete();
  }

  void getPlatform() {
    if (GetPlatform.isWeb) {
      limit(16);
    } else if (GetPlatform.isMobile) {
      limit(4);
    }
  }

  Future<void> getProducts() async {
    var response = await Dio().get(MyConstants.API_URL);

    print(response.data);
    response.data.forEach((e) {
      modelProducts.add(ModelProducts.fromJson(e));
    });

    if (modelProducts.length == 0) {
      loadingState(LoadingState.empty);
    } else {
      loadingState(LoadingState.loaded);
    }
  }
}
