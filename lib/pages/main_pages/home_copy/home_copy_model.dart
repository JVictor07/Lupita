import '/components/category_card/category_card_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_copy_widget.dart' show HomeCopyWidget;
import 'package:flutter/material.dart';

class HomeCopyModel extends FlutterFlowModel<HomeCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel1;
  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel2;
  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel3;
  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel4;
  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel5;
  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel6;
  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel7;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    categoryCardModel1 = createModel(context, () => CategoryCardModel());
    categoryCardModel2 = createModel(context, () => CategoryCardModel());
    categoryCardModel3 = createModel(context, () => CategoryCardModel());
    categoryCardModel4 = createModel(context, () => CategoryCardModel());
    categoryCardModel5 = createModel(context, () => CategoryCardModel());
    categoryCardModel6 = createModel(context, () => CategoryCardModel());
    categoryCardModel7 = createModel(context, () => CategoryCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    categoryCardModel1.dispose();
    categoryCardModel2.dispose();
    categoryCardModel3.dispose();
    categoryCardModel4.dispose();
    categoryCardModel5.dispose();
    categoryCardModel6.dispose();
    categoryCardModel7.dispose();
  }
}
