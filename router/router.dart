import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/screen/myhome_page.dart';
import 'package:todo_app/screen/post_page.dart';
import 'package:todo_app/screen/select_page.dart';
import 'package:todo_app/screen/signin_page.dart';
import 'package:todo_app/screen/sign_up.dart';
import 'package:todo_app/screen/start_page.dart';

class PageRouter {
  final GoRouter pageRouter = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const StartPage(),
        routes: <GoRoute>[
          GoRoute(
            path: 'signUp',
            builder: (BuildContext context, GoRouterState state) =>
                const SignUpPage(),
          ),
          GoRoute(
            path: 'signIn',
            builder: (BuildContext context, GoRouterState state) =>
                SignInPage(),
          ),
          GoRoute(
            path: 'select',
            builder: (BuildContext context, GoRouterState state) =>
                const SelectPage(),
          ),
          GoRoute(
            path: 'myhome',
            builder: (BuildContext context, GoRouterState state) =>
                const MyHomePage(),
          ),
          GoRoute(
            path: 'post',
            builder: (BuildContext context, GoRouterState state) =>
                const PostPage(),
          ),
        ],
      ),
    ],
  );
}
