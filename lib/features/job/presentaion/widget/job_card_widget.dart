import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kerja_mudah/core/constant/colors.dart';
import 'package:kerja_mudah/core/constant/textstyle.dart';
import 'package:kerja_mudah/core/presentation/widget/shimmer.dart';
import 'package:kerja_mudah/features/job/domain/entites/job_entity.dart';

class JobWidgetCard extends StatelessWidget {
  final JobEntity? jobEntity;
  const JobWidgetCard({this.jobEntity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: Material(
        elevation: 1.5,
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: 250, width: 320,
          child: Column(
            children: [
              Container(
                height: 150,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: AppColor.YELLOW, borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("1.000.000 IDR", style: AppTextStyle.body14(fontWeight: FontWeight.w700),),
                            Text("${jobEntity?.salaryPerHour?.toInt()} IDR/Hour", style: AppTextStyle.body10(color: AppColor.GREY),),
                          ],
                        )),
                        CachedNetworkImage(
                          imageUrl: jobEntity?.partnerUser?.photoUrl??"",
                          width: 100,
                          height: 50,
                          errorWidget: (context, error, _){
                            return Container();
                          },
                        ),
                      ],
                    ),
                    Container(
                      width: 250,
                      child: Text("${jobEntity?.title}", style: AppTextStyle.body16(fontWeight: FontWeight.w700, height: 0.9),),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: AppColor.GREEN,),
                        SizedBox(width: 5,),
                        Expanded(child: Text("DKI Jakarta", style: AppTextStyle.body10(fontWeight: FontWeight.w600),)),
                        Text("Kota Kasablanka", style: AppTextStyle.body10(fontWeight: FontWeight.w600, color: AppColor.GREY),)
                      ],
                    ),
                    Container(
                      height: 0.5, width: double.infinity, color: AppColor.GREY,
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time_outlined, color: AppColor.GREEN,),
                        SizedBox(width: 5,),
                        Expanded(child: Text("07:00 WIB", style: AppTextStyle.body10(fontWeight: FontWeight.w600),)),
                        Text("Right On-Time", style: AppTextStyle.body10(fontWeight: FontWeight.w600, color: AppColor.GREY),)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobCardShimmerWidget extends StatelessWidget {
  const JobCardShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: Material(
        elevation: 1.5,
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: 250, width: 320,
          child: Column(
            children: [
              Container(
                  height: 150,
                  child: AppShimmer(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  )
              ),
              Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: AppColor.GREEN,),
                        SizedBox(width: 5,),
                        SizedBox(width: 50, height: 10, child: AppShimmer()),
                        Expanded(child: Container()),
                        SizedBox(width: 100, height: 10, child: AppShimmer()),
                      ],
                    ),
                    Container(
                      height: 0.5, width: double.infinity, color: AppColor.GREY,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: AppColor.GREEN,),
                        SizedBox(width: 5,),
                        SizedBox(width: 50, height: 10, child: AppShimmer()),
                        Expanded(child: Container()),
                        SizedBox(width: 100, height: 10, child: AppShimmer()),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

