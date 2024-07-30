import 'con_status.dart';

abstract class ConStatusService {
  Stream<ConStatus> get status;
}
