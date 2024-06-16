import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_rooms/project/pages/calendar.dart';
import 'package:open_rooms/project/pages/door.dart';
import 'package:open_rooms/project/pages/error.dart';
import 'package:open_rooms/project/pages/home.dart';
import 'package:open_rooms/project/pages/login.dart';
import 'package:open_rooms/project/pages/profile.dart';
import 'package:open_rooms/project/routes/app_route_constants.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: MyAppRouteConstants.homeRouteName,
      builder: (context, state) => Home(),
      routes: [
        GoRoute(
          path: MyAppRouteConstants.profileRouteName,
          name: MyAppRouteConstants.profileRouteName,
          builder: (context, state) => Profile(),
        ),
        GoRoute(
          path: MyAppRouteConstants.doorRouteName,
          name: MyAppRouteConstants.doorRouteName,
          builder: (context, state) => Door(),
        ),
        GoRoute(
          path: MyAppRouteConstants.calendarRouteName,
          name: MyAppRouteConstants.calendarRouteName,
          builder: (context, state) => Calendar(),
        )
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorPage(),
);
