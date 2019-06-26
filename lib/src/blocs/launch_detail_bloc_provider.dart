import 'package:flutter/material.dart';

import 'launch_detail_bloc.dart';

export 'launches_bloc.dart';

class LaunchDetailBlocProvider extends InheritedWidget {
  final LaunchDetailBloc bloc;

  LaunchDetailBlocProvider({Key key, Widget child})
      : bloc = LaunchDetailBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static LaunchDetailBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(LaunchDetailBlocProvider)
            as LaunchDetailBlocProvider)
        .bloc;
  }
}
