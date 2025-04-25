class EndPoint {
  static String baseUrl =
      "http://127.0.0.1:8000/api/"; //http://10.0.2.2:5206/api/ // http://journijotsv1.runasp.net/api/
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
