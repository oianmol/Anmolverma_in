import 'package:anmolverma_in/anmolverma_in.dart';
import 'package:blogger/home/av_home.dart';
import 'package:blogger/presentations/av_presentations_section.dart';
import 'package:go_router/go_router.dart';

const rootRoute = '/';
const resumeRoute = "/resume";
const presentationRoute = "/presentations";

final blogRoutes = GoRouter(
  routes: [rootPageRoute(), resumePageRoute(), presentationPageRoute()],
);

presentationPageRoute() {
  return GoRoute(
    path: presentationRoute,
    builder: (context, state) => AVPresentationsSection(),
  );
}

resumePageRoute() {
  return GoRoute(
    path: resumeRoute,
    builder: (context, state) => ResumeHome(),
  );
}

GoRoute rootPageRoute() {
  return GoRoute(
    path: rootRoute,
    builder: (context, state) => AVHome(),
  );
}
