import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? SplashWidget() : SplashWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? SplashWidget() : SplashWidget(),
        ),
        FFRoute(
          name: SplashWidget.routeName,
          path: SplashWidget.routePath,
          builder: (context, params) => SplashWidget(),
        ),
        FFRoute(
          name: CadastroLoginWidget.routeName,
          path: CadastroLoginWidget.routePath,
          builder: (context, params) => CadastroLoginWidget(),
        ),
        FFRoute(
          name: DadosPessoaisWidget.routeName,
          path: DadosPessoaisWidget.routePath,
          builder: (context, params) => DadosPessoaisWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            nome: params.getParam(
              'nome',
              ParamType.String,
            ),
            urlImage: params.getParam(
              'urlImage',
              ParamType.String,
            ),
            phone: params.getParam(
              'phone',
              ParamType.String,
            ),
            provedor: params.getParam(
              'provedor',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ValidarTelefoneWidget.routeName,
          path: ValidarTelefoneWidget.routePath,
          builder: (context, params) => ValidarTelefoneWidget(
            imagem: params.getParam(
              'imagem',
              ParamType.String,
            ),
            nomeCompleto: params.getParam(
              'nomeCompleto',
              ParamType.String,
            ),
            numero: params.getParam(
              'numero',
              ParamType.String,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: BuscarEmpresaWidget.routeName,
          path: BuscarEmpresaWidget.routePath,
          builder: (context, params) => BuscarEmpresaWidget(
            telefone: params.getParam(
              'telefone',
              ParamType.String,
            ),
            idUser: params.getParam(
              'idUser',
              ParamType.int,
            ),
            voltar: params.getParam(
              'voltar',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: CadastrarAtividadeWidget.routeName,
          path: CadastrarAtividadeWidget.routePath,
          builder: (context, params) => CadastrarAtividadeWidget(
            company: params.getParam<CompanyRow>(
              'company',
              ParamType.SupabaseRow,
            ),
            criar: params.getParam(
              'criar',
              ParamType.bool,
            ),
            phone: params.getParam(
              'phone',
              ParamType.String,
            ),
            atividade: params.getParam<ActivityRow>(
              'atividade',
              ParamType.SupabaseRow,
            ),
            isUser: params.getParam(
              'isUser',
              ParamType.int,
            ),
            endereco: params.getParam(
              'endereco',
              ParamType.String,
            ),
            nomeEmpresa: params.getParam(
              'nomeEmpresa',
              ParamType.String,
            ),
            img: params.getParam(
              'img',
              ParamType.String,
            ),
            perfilEmpresa: params.getParam(
              'perfilEmpresa',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: DadosEmpresaWidget.routeName,
          path: DadosEmpresaWidget.routePath,
          builder: (context, params) => DadosEmpresaWidget(
            company: params.getParam<CompanyRow>(
              'company',
              ParamType.SupabaseRow,
            ),
            criar: params.getParam(
              'criar',
              ParamType.bool,
            ),
            phone: params.getParam(
              'phone',
              ParamType.String,
            ),
            atividade: params.getParam<ActivityRow>(
              'atividade',
              ParamType.SupabaseRow,
            ),
            idUser: params.getParam(
              'idUser',
              ParamType.int,
            ),
            endereco: params.getParam(
              'endereco',
              ParamType.String,
            ),
            nomeEmpresa: params.getParam(
              'nomeEmpresa',
              ParamType.String,
            ),
            img: params.getParam(
              'img',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: EsqueciSenhaWidget.routeName,
          path: EsqueciSenhaWidget.routePath,
          builder: (context, params) => EsqueciSenhaWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: NovaSenhaWidget.routeName,
          path: NovaSenhaWidget.routePath,
          builder: (context, params) => NovaSenhaWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: HomePainelGeralWidget.routeName,
          path: HomePainelGeralWidget.routePath,
          builder: (context, params) => HomePainelGeralWidget(),
        ),
        FFRoute(
          name: ComoFuncionaWidget.routeName,
          path: ComoFuncionaWidget.routePath,
          builder: (context, params) => ComoFuncionaWidget(),
        ),
        FFRoute(
          name: SplashLoginGoogleWidget.routeName,
          path: SplashLoginGoogleWidget.routePath,
          builder: (context, params) => SplashLoginGoogleWidget(
            provedorAuth: params.getParam(
              'provedorAuth',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SplashLoginAppleWidget.routeName,
          path: SplashLoginAppleWidget.routePath,
          builder: (context, params) => SplashLoginAppleWidget(
            provadorAuth: params.getParam(
              'provadorAuth',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PreLancamentoWidget.routeName,
          path: PreLancamentoWidget.routePath,
          builder: (context, params) => PreLancamentoWidget(),
        ),
        FFRoute(
          name: TelaTesteDevWidget.routeName,
          path: TelaTesteDevWidget.routePath,
          builder: (context, params) => TelaTesteDevWidget(),
        ),
        FFRoute(
          name: PerfilWidget.routeName,
          path: PerfilWidget.routePath,
          builder: (context, params) => PerfilWidget(
            userProfissional: params.getParam<UserProfissionaisRow>(
              'userProfissional',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: FeedbackWidget.routeName,
          path: FeedbackWidget.routePath,
          builder: (context, params) => FeedbackWidget(),
        ),
        FFRoute(
          name: AjudaWidget.routeName,
          path: AjudaWidget.routePath,
          builder: (context, params) => AjudaWidget(),
        ),
        FFRoute(
          name: SuporteWidget.routeName,
          path: SuporteWidget.routePath,
          builder: (context, params) => SuporteWidget(),
        ),
        FFRoute(
          name: PerfilEmpresaWidget.routeName,
          path: PerfilEmpresaWidget.routePath,
          builder: (context, params) => PerfilEmpresaWidget(
            company: params.getParam<CompanyRow>(
              'company',
              ParamType.SupabaseRow,
            ),
            atividade: params.getParam<ActivityRow>(
              'atividade',
              ParamType.SupabaseRow,
            ),
            categoria: params.getParam(
              'categoria',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: OrcamentosWidget.routeName,
          path: OrcamentosWidget.routePath,
          builder: (context, params) => OrcamentosWidget(),
        ),
        FFRoute(
          name: AvaliacoesWidget.routeName,
          path: AvaliacoesWidget.routePath,
          builder: (context, params) => AvaliacoesWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splash';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).azulApp,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Logo_Indicaz_Branco.png',
                      width: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
