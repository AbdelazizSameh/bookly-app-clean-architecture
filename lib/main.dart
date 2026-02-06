import 'package:bookly_app/core/functions/simple_bloc_observer.dart';
import '/Features/home/data/repos/home_repo_implementation.dart';
import '/Features/home/domain/entities/book_entity.dart';
import '/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import '/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import '/Features/home/presentation/manager/fetch_newest_books/newest_books_cubit.dart';
import '/constants.dart';
import '/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'core/functions/setup_service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(
              homeRepo: getIt.get<HomeRepoImplementation>(),
            ),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            FetchNewestBooksUseCase(
              homeRepo: getIt.get<HomeRepoImplementation>(),
            ),
          )..fetchNewestBooks(),
        ),
      ],

      child: MaterialApp.router(
        routerConfig: AppRouter.appRouter,
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
