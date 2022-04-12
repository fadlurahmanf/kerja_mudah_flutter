import 'package:get_it/get_it.dart';
import 'package:kerja_mudah/features/job/data/job_datasource.dart';


class JobModule{
  static void init(){
    GetIt.I.registerFactory(() => JobImpl(client: GetIt.I()));
  }
}