import 'dart:async';

import 'package:dio/dio.dart';
import 'package:kerja_mudah/core/data/domain/base_response.dart';
import 'package:kerja_mudah/core/utilities/network/handle_response.dart';
import 'package:kerja_mudah/features/job/domain/entites/job_entity.dart';

abstract class JobDataSource{
  FutureOr<BaseResponse<List<JobEntity>>> getAllJobsPerCategories();
}

class JobImpl extends JobDataSource{
  final Dio client;
  JobImpl({required this.client});

  @override
  FutureOr<BaseResponse<List<JobEntity>>> getAllJobsPerCategories() {
    return handleResponse(
        request: () async => client.get("job/all"),
        onSuccess: (result){
          return BaseResponse<List<JobEntity>>.fromJson(result.data, (json){
            var list = json as Iterable;
            return list.map((e) => JobEntity.fromJson(e)).toList();
          });
        }
    );
  }
}