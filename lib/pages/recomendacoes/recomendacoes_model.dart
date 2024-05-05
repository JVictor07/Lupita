import '/flutter_flow/flutter_flow_util.dart';
import 'recomendacoes_widget.dart' show RecomendacoesWidget;
import 'package:flutter/material.dart';

class RecomendacoesModel extends FlutterFlowModel<RecomendacoesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
