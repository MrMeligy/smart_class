import 'package:smart_class/core/cache/cache_helper.dart';
import 'package:smart_class/core/service_locator/service_locator.dart';

class EndPoint {
  static String baseUrl = "";
  static String updatedUrl() {
    if (getIt<CacheHelper>().getDataString(key: "ip")!.isEmpty) {
      return "192";
    }
    return getIt<CacheHelper>().getDataString(key: "ip").toString();
  }

  static String getStatues = "status";
  static String controlSystem({required String mode}) {
    return "system?state=$mode";
  }

  static String windowControl({required String mode}) {
    return "window?action=$mode";
  }

  static String projectorControl({required String mode}) {
    return "projector?action=$mode";
  }

  static String fanControl({required String mode}) {
    return "fan?mode=$mode";
  }

  static String fanPower({required String power}) {
    return "fan/power?state=$power";
  }

  static String lightControl({required String mode}) {
    return "light?mode=$mode";
  }

  static String lightPower({required String power}) {
    return "light/power?state=$power";
  }
}

class ApiKey {
  static String status = "status";
  static String message = "message";
}
