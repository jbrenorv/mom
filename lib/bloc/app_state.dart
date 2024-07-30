import '../utils/constants.dart';

class AppState {
  AppState({
    this.brokerBinPath,
    this.brokerUrl = Constants.brokerDefaultUrl,
  });
  
  final String? brokerBinPath;
  final String brokerUrl;
}
