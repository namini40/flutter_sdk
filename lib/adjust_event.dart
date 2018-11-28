import 'dart:convert';

class AdjustEvent {
  String eventToken;
  num revenue;
  String currency;
  String orderId;
  String callbackId;

  Map<String, String> callbackParameters;
  Map<String, String> partnerParameters;

  AdjustEvent(this.eventToken) {
    callbackParameters = new Map<String, String>();
    partnerParameters = new Map<String, String>();
  }

  void addCallbackParameter(String key, String value) {
    callbackParameters[key] = value;
  }

  void addPartnerParameter(String key, String value) {
    partnerParameters[key] = value;
  }

  Map<String, String> get adjustEventParamsMap {
    Map<String, String> adjustEventParamsMap = {
      'eventToken': eventToken
    };

    if (revenue != null) {
      adjustEventParamsMap['revenue'] = revenue.toString();
    }
    if (currency != null) {
      adjustEventParamsMap['currency'] = currency;
    }
    if (orderId != null) {
      adjustEventParamsMap['orderId'] = orderId;
    }
    if (callbackId != null) {
      adjustEventParamsMap['callbackId'] = callbackId;
    }

    if (callbackParameters.length > 0) {
      adjustEventParamsMap['callbackParameters'] =
          json.encode(callbackParameters);
    }

    if (partnerParameters.length > 0) {
      adjustEventParamsMap['partnerParameters'] =
          json.encode(partnerParameters);
    }
    
    return adjustEventParamsMap;
  }
}
