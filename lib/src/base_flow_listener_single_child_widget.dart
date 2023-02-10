import 'package:flutter/widgets.dart';
import 'package:provider/single_child_widget.dart';
import 'package:view_model_x/src/flow.dart';

/// This abstract class allows to get notified when it's [BaseFlow] call `notifyListeners()`.
/// It can also be be used with [MultiFlowListener]
abstract class BaseFlowListenerSingleChildWidget
    extends SingleChildStatefulWidget {
  final BaseFlow baseFlow;

  const BaseFlowListenerSingleChildWidget(
      {super.key, required this.baseFlow, super.child});

  void onNotifyListener(BuildContext context);

  @override
  SingleChildState<BaseFlowListenerSingleChildWidget> createState() =>
      _BaseFlowListenerState();
}

class _BaseFlowListenerState
    extends SingleChildState<BaseFlowListenerSingleChildWidget> {
  @override
  void initState() {
    super.initState();
    widget.baseFlow.addListener(_stateListener);
  }

  @override
  void dispose() {
    widget.baseFlow.removeListener(_stateListener);
    super.dispose();
  }

  void _stateListener() {
    if (mounted) {
      widget.onNotifyListener(context);
    }
  }

  @override
  void didUpdateWidget(covariant BaseFlowListenerSingleChildWidget oldWidget) {
    if (widget.baseFlow != oldWidget.baseFlow) {
      _migrate(widget.baseFlow, oldWidget.baseFlow, _stateListener);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _migrate(Listenable a, Listenable b, void Function() listener) {
    b.removeListener(listener);
    a.addListener(listener);
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    assert(child != null,
        '''${widget.runtimeType} used outside of MultiBlocListener must specify a child''');
    return child!;
  }
}
