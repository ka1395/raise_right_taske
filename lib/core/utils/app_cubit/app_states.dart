abstract class AppStates {}

class AppInitialState extends AppStates {}

class ChangeDarkThemeState extends AppStates {}

class ChangeLanguageState extends AppStates {}

class SelecLanguageState extends AppStates {}

class OTPSuccessState extends AppStates {
  final String messageSuccess;

  OTPSuccessState(this.messageSuccess);
}

class OTPLoadingState extends AppStates {}

class OTPErrorState extends AppStates {
  final String messageError;

  OTPErrorState(this.messageError);
}

class OTPVerificationLoadingState extends AppStates {}

class OTPVerificationSuccessState extends AppStates {
  final String messageSuccess;

  OTPVerificationSuccessState(this.messageSuccess);
}

class OTPVerificationErrorState extends AppStates {
  final String messageError;

  OTPVerificationErrorState(this.messageError);
}

final class HomeGetDataLoadingState extends AppStates {}
final class HomeGetDataSuccessState extends AppStates {}