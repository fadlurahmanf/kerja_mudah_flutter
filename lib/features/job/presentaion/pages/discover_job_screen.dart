import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kerja_mudah/core/constant/colors.dart';
import 'package:kerja_mudah/core/constant/textstyle.dart';
import 'package:kerja_mudah/core/presentation/widget/shimmer.dart';
import 'package:kerja_mudah/features/job/domain/entites/job_entity.dart';
import 'package:kerja_mudah/features/job/presentaion/bloc/all_job_bloc.dart';
import 'package:kerja_mudah/features/job/presentaion/bloc/all_job_event.dart';
import 'package:kerja_mudah/features/job/presentaion/bloc/all_job_state.dart';
import 'package:kerja_mudah/core/extension/string.dart';
import 'package:kerja_mudah/features/job/presentaion/widget/job_card_widget.dart';

class DiscoverJobScreen extends StatelessWidget {
  const DiscoverJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AllJobBloc>(create: (context) => AllJobBloc()),
        ],
        child: DiscoverJobLayout()
    );
  }
}

class DiscoverJobLayout extends StatefulWidget {
  const DiscoverJobLayout({Key? key}) : super(key: key);

  @override
  State<DiscoverJobLayout> createState() => _DiscoverJobLayoutState();
}

class _DiscoverJobLayoutState extends State<DiscoverJobLayout> {
  AllJobBloc? allJobBloc;

  @override
  void initState() {
    allJobBloc = BlocProvider.of<AllJobBloc>(context);
    super.initState();
    allJobBloc?.add(GetAllJobEvent());
  }

  Map<String, List<JobEntity>> mapJobBasedCategory = {};

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<AllJobBloc, AllJobState>(
            listener: (context, state){
              if(state is GetAllJobSuccessState){
                state.listJobs?.forEach((element) {
                  if(mapJobBasedCategory[element.category?.type??""] == null){
                    mapJobBasedCategory[element.category?.type??""] = [element];
                  }else{
                    List<JobEntity> listJob = mapJobBasedCategory[element.category?.type??""]??<JobEntity>[];
                    listJob.add(element);
                    mapJobBasedCategory[element.category?.type??""] = listJob;
                  }
                });
              }else if(state is AllJobLoadingState){

              }else if(state is GetAllJobFailedState){
                print("MASUK error ${state.message}");
              }
            },
          )
        ],
        child: _layout()
    );
  }

  Widget _layout(){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).viewPadding.top,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Hello there.", style: AppTextStyle.body20(fontWeight: FontWeight.w700, color: AppColor.GREEN),),
                        Text("Haven't registered yet?", style: AppTextStyle.body10(fontWeight: FontWeight.w200, color: AppColor.GREY),),
                        Text("Register now to start working right away!", style: AppTextStyle.body10(fontWeight: FontWeight.w200, color: AppColor.GREY),),
                      ],
                    )),
                    SizedBox(width: 15,),
                    GestureDetector(
                      onTap: () async {
                        allJobBloc?.add(GetAllJobEvent());
                      },
                      child: Container(
                        height: 100, width: 100,
                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColor.GREEN, width: 1)),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: BlocBuilder<AllJobBloc, AllJobState>(
                      builder: (context, state){
                        if(state is AllJobLoadingState){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Container(height: 15, width: 100, margin: EdgeInsets.only(left: 10), child: AppShimmer(),),
                              SizedBox(height: 10,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: const [
                                    JobCardShimmerWidget(),
                                    JobCardShimmerWidget(),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(height: 15, width: 100, margin: EdgeInsets.only(left: 10), child: AppShimmer(),),
                              SizedBox(height: 10,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: const [
                                    JobCardShimmerWidget(),
                                    JobCardShimmerWidget(),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }else{
                          return SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: mapCategory<Widget>(mapJobBasedCategory, (String category, List<JobEntity> listJob){
                                return Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(category.capitalizeFirstLetter(), style: AppTextStyle.body16(fontWeight: FontWeight.w700),),
                                      SizedBox(
                                        width: double.infinity,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          physics: BouncingScrollPhysics(),
                                          child: Row(
                                            children: mapJob<Widget>(listJob, (JobEntity job){
                                              return JobWidgetCard(jobEntity: job,);
                                            }),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          );
                        }
                      },
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  mapCategory<Widget>(Map<String, List<JobEntity>> map, Function handler){
    List<Widget> listWidget = [];
    map.forEach((key, value) {
      listWidget.add(handler(key, value));
    });
    return listWidget;
  }

  mapJob<Widget>(List<JobEntity> list, Function handler){
    List<Widget> listWidget = [];
    for(var i = 0; i<list.length; i++){
      listWidget.add(handler(list[i]));
    }
    return listWidget;
  }
}

