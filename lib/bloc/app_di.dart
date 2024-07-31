import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/services.dart';
import 'app_bloc.dart';

abstract class AppDi {
  static Future<void> resolveAsyncDependencies() async {
    
    // resolve shared preferences instance
    final sharedPreferences = await SharedPreferences.getInstance();
    GetIt.instance.registerSingleton<SharedPreferences>(sharedPreferences);
  }

  static List<RepositoryProvider> repositories = [
    // services
    RepositoryProvider<ConStatusService>.value(
      value: ConStatusServiceImpl(),
    ),

    RepositoryProvider<MomService>.value(
      value: MomServiceImpl(),
    ),

    RepositoryProvider<ExternalStorageService>.value(
      value: ExternalStorageServiceImpl(FilePicker.platform),
    ),

    RepositoryProvider<LocalStorageService>.value(
      value: LocalStorageServiceImpl(
        GetIt.instance.get<SharedPreferences>()
      ),
    ),
  ];

  static List<BlocProvider> blocs = [
    BlocProvider.value(value: AppBloc()),
  ];
}
