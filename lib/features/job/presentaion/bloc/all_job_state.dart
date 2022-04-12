import 'package:equatable/equatable.dart';
import 'package:kerja_mudah/features/job/domain/entites/job_entity.dart';

class AllJobState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ALlJobInitialState extends AllJobState{}

class AllJobLoadingState extends AllJobState{}

class GetAllJobSuccessState extends AllJobState{
  final List<JobEntity>? listJobs;

  GetAllJobSuccessState({this.listJobs});

  @override
  List<Object?> get props => [listJobs];
}

class GetAllJobFailedState extends AllJobState{
  final String? message;
  GetAllJobFailedState({this.message});

  @override
  List<Object?> get props => [message];
}