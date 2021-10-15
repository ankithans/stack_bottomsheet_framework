// library stack_bottomsheet_framework;
import 'package:flutter/material.dart';

import 'head_bottom_sheet.dart';
import 'head_title_description.dart';
import 'main_button.dart';
import 'models/list_bottom_sheet_data.dart';
// import 'utils/color_helpers.dart';
import 'utils/size_helpers.dart';

export 'models/list_bottom_sheet_data.dart';
export 'package:stack_bottomsheet_framework/stack_bottomsheet_framework.dart'
    show customBottomSheet, ColorOptions;

class ColorOptions {
  late Color sheetBackgroundColor;
  late Color sheetBarrierColor;

  ColorOptions(
      {required Color sheetBackgroundColor, required Color sheetBarrierColor}) {
    this.sheetBackgroundColor = sheetBackgroundColor;
    this.sheetBarrierColor = sheetBarrierColor;
  }
}

int index = 0;
Future<dynamic> customBottomSheet({
  required context,
  required double height,
  required int level,
  required List<Widget> widgetList,
  required List<BottomSheetData> bdata,
  ColorOptions? colorOptions,
}) {
  bool isActive = true;
  String buttonTitle = bdata[index].button;
  String title = bdata[index].title;
  String description = bdata[index].description;
  String afterTitle = bdata[index].afterTitle;
  String afterDescription = bdata[index].afterDescription;

  return showModalBottomSheet<void>(
    elevation: 2.0,
    barrierColor: colorOptions == null
        ? Colors.grey.withOpacity(0.3)
        : colorOptions.sheetBarrierColor,
    backgroundColor:
        colorOptions == null ? Colors.white : colorOptions.sheetBackgroundColor,
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            height: displayHeight(context) * height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: isActive
                      ? HeadTitleDescription(
                          title: title,
                          description: description,
                        )
                      : HeadBottomSheet(
                          title: afterTitle,
                          description: afterDescription,
                        ),
                ),
                AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: widgetList[index]),
                SizedBox(
                  height: displayHeight(context) * 0.02,
                ),
                level == 1
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: displayWidth(context),
                          child: MainButton(
                            title: buttonTitle,
                            onPressed: () {},
                          ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: displayWidth(context),
                          child: MainButton(
                            title: buttonTitle,
                            onPressed: () async {
                              setState(() {
                                index++;

                                buttonTitle = bdata[index].button;
                                title = bdata[index].title;
                                description = bdata[index].description;
                                isActive = false;
                              });
                              await customBottomSheet(
                                context: context,
                                height: height - 0.1,
                                level: level - 1,
                                widgetList: widgetList,
                                bdata: bdata,
                                colorOptions: colorOptions,
                              );
                              setState(() {
                                index--;

                                buttonTitle = bdata[index].button;
                                title = bdata[index].title;
                                description = bdata[index].description;
                                afterTitle = bdata[index].afterTitle;
                                afterDescription =
                                    bdata[index].afterDescription;
                                isActive = true;
                              });
                            },
                          ),
                        ),
                      ),
              ],
            ),
          );
        },
      );
    },
  );
}
