class DashboardState {}

class DashboardInitial extends DashboardState {}

class GetInitCoinsLoadingState extends DashboardState {}

class GetInitCoinsSuccessState extends DashboardState {
  GetInitCoinsSuccessState();
}

class GetInitCoinsErrorState extends DashboardState {
  final String message;
  GetInitCoinsErrorState(this.message);
}

// WebSocket Connection States
class WsConnectingState extends DashboardState {}

class WsConnectedState extends DashboardState {}

class WsDisconnectedState extends DashboardState {}

class WsReconnectingState extends DashboardState {}
class WsUpdateState extends DashboardState {}

// // WebSocket Data Update States
// class WsPriceUpdateState extends DashboardState {
//   final Map<String, dynamic> data;
//   WsPriceUpdateState(this.data);
// }

// class WsListingStatusUpdateState extends DashboardState {
//   final Map<String, dynamic> data;
//   WsListingStatusUpdateState(this.data);
// }
