import 'package:get_it/get_it.dart';
import 'package:kerja_mudah/core/core_module.dart';
import 'package:kerja_mudah/core/data/datasource/build_config.dart';
import 'package:kerja_mudah/features/job/job_module.dart';

class MainModule{
  static Future<void> init(
    {required BuildConfig Function() buildConfig}) async {
    GetIt.I.registerLazySingleton<BuildConfig>(() => buildConfig());

    await loadModules();
  }

  static Future<void> loadModules() async {
    await CoreModule.init();
    JobModule.init();
  }
}