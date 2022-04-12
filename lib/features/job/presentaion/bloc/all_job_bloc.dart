import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kerja_mudah/core/utilities/network/response_exception.dart';
import 'package:kerja_mudah/features/job/data/job_datasource.dart';
import 'package:kerja_mudah/features/job/presentaion/bloc/all_job_event.dart';
import 'package:kerja_mudah/features/job/presentaion/bloc/all_job_state.dart';

class AllJobBloc extends Bloc<AllJobEvent, AllJobState>{
  AllJobBloc() : super(AllJobLoadingState()){
    on<GetAllJobEvent>((event, emit)async{
      emit(AllJobLoadingState());
      try{
        var result = await GetIt.I<JobImpl>().getAllJobsPerCategories();
        if(result.code == 200){
          emit(GetAllJobSuccessState(listJobs: result.data));
        }else{
          emit(GetAllJobFailedState(message: result.message));
        }
      }catch(e){
        if(e is ResponseException){
          emit(GetAllJobFailedState(message: e.message));
        }else{
          emit(GetAllJobFailedState(message: e.toString()));
        }
      }
    });
  }



}