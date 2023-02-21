import 'package:flutter/material.dart';
import 'package:telegram_plus/blocs/app_bloc.dart';
import 'package:telegram_plus/storage/mock_database.dart';

class AppStateContainer extends StatefulWidget {
  final Widget child;
  final BlockProvider blockProvider;
  const AppStateContainer({
    Key? key,
    required this.child,
    required this.blockProvider,
  });

  static AppState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_AppStoreContainer>()!
        .appData;
  }

  @override
  State<AppStateContainer> createState() => AppState();
}

class AppState extends State<AppStateContainer> {
  BlockProvider get blockProvider => widget.blockProvider;
  @override
  Widget build(BuildContext context) {
    return _AppStoreContainer(
      appData: this,
      blockProvider: widget.blockProvider,
      child: widget.child,
    );
  }
}

class _AppStoreContainer extends InheritedWidget {
  final AppState appData;
  final BlockProvider blockProvider;

  _AppStoreContainer({
    Key? key,
    required this.appData,
    required this.blockProvider,
    required Widget child,
  }) : super(key: key, child: child);
  @override
  bool updateShouldNotify(_AppStoreContainer oldWidget) {
    return true; ///////////
  }
}

// class ServiceProvider {
//   ChatService chatService;
//   ServiceProvider({required this.chatService});
// }

class BlockProvider {
  AppBloc appBloc;
  BlockProvider({required this.appBloc});
}
