class DashboardState {}

class DashboardInitial extends DashboardState {}

class GetCoinsLoadingState extends DashboardState {}

class GetCoinsSuccessState extends DashboardState {
  GetCoinsSuccessState();
}

class GetCoinsErrorState extends DashboardState {
  final String message;
  GetCoinsErrorState(this.message);
}
