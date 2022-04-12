import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerja_mudah/core/constant/assets.dart';
import 'package:kerja_mudah/core/constant/colors.dart';
import 'package:kerja_mudah/core/constant/textstyle.dart';
import 'package:kerja_mudah/core/presentation/widget/button.dart';
import 'package:kerja_mudah/core/routes/routes.dart';
import 'package:kerja_mudah/features/onboard/presentation/widget/select_language_dialog.dart';
import 'package:kerja_mudah/generated/l10n.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardLayout();
  }
}

class OnBoardLayout extends StatefulWidget {
  const OnBoardLayout({Key? key}) : super(key: key);

  @override
  State<OnBoardLayout> createState() => _OnBoardLayoutState();
}

class _OnBoardLayoutState extends State<OnBoardLayout> {
  final bannerPageController = PageController(viewportFraction: 0.85);
  bool showBanner = false;
  int indexBanner = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      if(Get.isDialogOpen == true){
        Get.back();
      }
      Locale locale = Locale('en');
      await Get.dialog(SelectLanguageDialog(
        englishCallBack: () async {
          locale = Locale('en');
          Get.back();
        },
        indonesiaCallBack: () async {
          locale = Locale('id');
          Get.back();
        },
      ), barrierDismissible: false).then((value)async{
        await Get.updateLocale(locale).then((value){
          setState(() {});
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
        child: Column(
          children: [
            Center(
              child: Text("kerjamudah.", style: AppTextStyle.body12(
                color: AppColor.GREEN
              ),),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(S.of(context).onboard_1, textAlign: TextAlign.center, style: AppTextStyle.body22(
                    color: AppColor.GREEN, height: 1,
                    fontWeight: FontWeight.w700
                ),),
              ),
            ),
            Visibility(
              visible: !showBanner,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Text(S.of(context).onboard_2, textAlign: TextAlign.center, style: AppTextStyle.body12(
                          color: AppColor.GREY,
                          fontWeight: FontWeight.w200
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: AppButton(
                        onPressed: () async {
                          setState(() {
                            showBanner = true;
                          });
                        },
                        child: (context, style){
                          return Text(S.of(context).get_started, style: style,);
                        },
                        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 7),
                      ),
                    ),
                    Expanded(child: SizedBox(
                      height: double.infinity, width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Image.asset(Assets.gradientOnBoard),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset(Assets.personOnBoard)
                              )
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: showBanner,
              child: Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: bannerWidget(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: mapIndicator<Widget>(bannerList, (int index){
                        return index == indexBanner ? Container(
                          width: 50, height: 17, margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(color: AppColor.YELLOW, borderRadius: BorderRadius.circular(35)),
                        ) : Container(
                          width: 17, height: 17, margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(color: AppColor.YELLOW.withOpacity(0.5), shape: BoxShape.circle),
                        );
                      }),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: AppButton(
                        onPressed: () async {
                          Get.toNamed(AppRoutesName.DISCOVER_JOB);
                        },
                        child: (context, style){
                          return Text(S.of(context).discover_jobs, style: style,);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                      child: Row(
                        children: [
                          Expanded(child: AppButton(
                            type: AppButtonType.OUTLINED,
                            child: (context, style){
                              return Text(S.of(context).log_in, style: style,);
                            },
                          )),
                          SizedBox(width: 10,),
                          Expanded(child: AppButton(
                            type: AppButtonType.OUTLINED,
                            child: (context, style){
                              return Text(S.of(context).register, style: style,);
                            },
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  mapIndicator<Widget>(List list, Function handler){
    List<Widget> listWidget = [];
    for(var i = 0; i<list.length; i++){
      listWidget.add(handler(i));
    }
    return listWidget;
  }

  List<Color> bannerList = [
    AppColor.GREEN,
    AppColor.YELLOW,
    AppColor.BLUE,
    AppColor.TEAL,
  ];

  Widget bannerWidget(){
    return PageView.builder(
      itemCount: bannerList.length,
      controller: bannerPageController,
      physics: BouncingScrollPhysics(),
      allowImplicitScrolling: true,
      onPageChanged: (index){
        setState(() {
          indexBanner = index;
        });
      },
      itemBuilder: (context, position){
        return Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: bannerList[position]),
            ),
          ),
        );
      },
    );
  }
}

