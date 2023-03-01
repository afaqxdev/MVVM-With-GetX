import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/res/color/app_colors.dart';

class GernalException extends StatefulWidget {
  final VoidCallback onPress;
  const GernalException({required this.onPress, super.key});

  @override
  State<GernalException> createState() => _GernalExceptionState();
}

class _GernalExceptionState extends State<GernalException> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: height * .15,
          ),
          const Icon(
            Icons.cloud_off_outlined,
            color: AppColor.grayColor,
            size: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
                child: Text(
              "gernal_exception".tr,
              textAlign: TextAlign.center,
            )),
          ),
          SizedBox(
            height: height * .15,
          ),
          InkWell(
            onTap: widget.onPress,
            child: Container(
                decoration: BoxDecoration(
                    color: AppColor.greenColor,
                    borderRadius: BorderRadius.circular(20)),
                height: 44,
                width: 160,
                child: Center(
                  child: Text("Retry",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                          )),
                )),
          )
        ],
      ),
    );
  }
}
