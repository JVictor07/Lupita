import '/components/category_card/category_card_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_copy_model.dart';
export 'home_copy_model.dart';

class HomeCopyWidget extends StatefulWidget {
  const HomeCopyWidget({super.key});

  @override
  State<HomeCopyWidget> createState() => _HomeCopyWidgetState();
}

class _HomeCopyWidgetState extends State<HomeCopyWidget> {
  late HomeCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.returnConcatenedArrayAnswer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.solidUserCircle,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'sgj607ei' /* Bem vinda, Fulana */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 144.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).blueShadow,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: FlutterFlowCalendar(
                              color: const Color(0xFF3678E9),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              weekFormat: true,
                              weekStartsMonday: true,
                              initialDate: getCurrentTimestamp,
                              rowHeight: 64.0,
                              onChange: (DateTimeRange? newSelectedDate) async {
                                if (_model.calendarSelectedDay ==
                                    newSelectedDate) {
                                  return;
                                }
                                _model.calendarSelectedDay = newSelectedDate;
                                setState(() {
                                  FFAppState().selectedDate = dateTimeFormat(
                                    'd/M/y',
                                    _model.calendarSelectedDay!.start,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  );
                                });
                                setState(() {});
                              },
                              titleStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                              dayOfWeekStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                              dateStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                              selectedDateStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              inactiveDateStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                    child: wrapWithModel(
                      model: _model.categoryCardModel1,
                      updateCallback: () => setState(() {}),
                      child: CategoryCardWidget(
                        title: FFLocalizations.of(context).getText(
                          'fx0bnd4f' /* Geral Health */,
                        ),
                        icon: const Icon(
                          Icons.health_and_safety_outlined,
                        ),
                        options: FFAppConstants.geralQuestions,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                    child: wrapWithModel(
                      model: _model.categoryCardModel2,
                      updateCallback: () => setState(() {}),
                      child: CategoryCardWidget(
                        title: FFLocalizations.of(context).getText(
                          '67jxoqke' /* Muscle and joint */,
                        ),
                        icon: const Icon(
                          Icons.boy_outlined,
                        ),
                        options: FFAppConstants.MuscleAndJointHealth,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                    child: wrapWithModel(
                      model: _model.categoryCardModel3,
                      updateCallback: () => setState(() {}),
                      child: CategoryCardWidget(
                        title: FFLocalizations.of(context).getText(
                          'a3msu34g' /* Skin and Mouth */,
                        ),
                        icon: const FaIcon(
                          FontAwesomeIcons.grin,
                        ),
                        options: FFAppConstants.skinAndMouth,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                      child: wrapWithModel(
                        model: _model.categoryCardModel4,
                        updateCallback: () => setState(() {}),
                        child: CategoryCardWidget(
                          title: FFLocalizations.of(context).getText(
                            'np6jgajl' /* Head */,
                          ),
                          icon: const FaIcon(
                            FontAwesomeIcons.headSideVirus,
                          ),
                          options: FFAppConstants.head,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                    child: wrapWithModel(
                      model: _model.categoryCardModel5,
                      updateCallback: () => setState(() {}),
                      child: CategoryCardWidget(
                        title: FFLocalizations.of(context).getText(
                          'u7mmh6k6' /* Breathing */,
                        ),
                        icon: const Icon(
                          Icons.air,
                        ),
                        options: FFAppConstants.breathing,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                    child: wrapWithModel(
                      model: _model.categoryCardModel6,
                      updateCallback: () => setState(() {}),
                      child: CategoryCardWidget(
                        title: FFLocalizations.of(context).getText(
                          'ch5yma60' /* Pee */,
                        ),
                        icon: const Icon(
                          Icons.water_drop_outlined,
                        ),
                        options: FFAppConstants.pee,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                    child: wrapWithModel(
                      model: _model.categoryCardModel7,
                      updateCallback: () => setState(() {}),
                      child: CategoryCardWidget(
                        title: FFLocalizations.of(context).getText(
                          '8rguu8gr' /* Circulation Health */,
                        ),
                        icon: const Icon(
                          Icons.favorite_border_sharp,
                        ),
                        options: FFAppConstants.changeInCirculation,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
