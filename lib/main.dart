import 'package:api_handle_dio/data/repositories/post_repo.dart';
import 'package:api_handle_dio/logic/cubit/post_cubit/post_cubit.dart';
import 'package:api_handle_dio/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PostRepo postRepo = PostRepo();
  postRepo.fetchPosts();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
