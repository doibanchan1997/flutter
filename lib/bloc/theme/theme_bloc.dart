import 'dart:async';

import 'them_state.dart';
import 'theme_event.dart';

class ThemeBloc {
  var state = ThemeState('asdasdasd');

  final eventController = StreamController<ChangeThemeEvent>();

  final stateController = StreamController<ThemeState>();

  ThemeBloc() {
    eventController.stream.listen((ChangeThemeEvent event) {
      state = ThemeState(event.content);
      stateController.add(state);
    });
  }
}
