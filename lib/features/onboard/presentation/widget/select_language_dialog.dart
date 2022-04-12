import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerja_mudah/core/constant/assets.dart';
import 'package:kerja_mudah/core/constant/colors.dart';
import 'package:kerja_mudah/core/constant/textstyle.dart';
import 'package:kerja_mudah/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class SelectLanguageDialog extends StatelessWidget {
  final VoidCallback englishCallBack;
  final VoidCallback indonesiaCallBack;
  const SelectLanguageDialog({
    required this.englishCallBack, required this.indonesiaCallBack,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp)
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(S.of(context).choose_language, style: AppTextStyle.body14(fontWeight: FontWeight.w600),),
              ),
              GestureDetector(
                onTap: englishCallBack,
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 55,
                        height: 30,
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Assets.englishFlag), fit: BoxFit.cover), borderRadius: BorderRadius.circular(5)),
                      ),
                      SizedBox(width: 15,),
                      Expanded(child: Text("English", style: AppTextStyle.body12(fontWeight: FontWeight.w600, color: AppColor.GREY),)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: indonesiaCallBack,
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 55,
                        height: 30,
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Assets.indonesiaFlag), fit: BoxFit.cover), borderRadius: BorderRadius.circular(5)),
                      ),
                      SizedBox(width: 15,),
                      Expanded(child: Text("Indonesia", style: AppTextStyle.body12(fontWeight: FontWeight.w600, color: AppColor.GREY),)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
