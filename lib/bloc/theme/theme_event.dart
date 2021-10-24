abstract class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  ChangeThemeEvent(this.content);
  final String content;
}
