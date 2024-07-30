import 'mom_service.dart';

abstract class MomSubscriberService extends MomService {
  subscribe();

  unsubscribe();

  onMessage(String message);
}
