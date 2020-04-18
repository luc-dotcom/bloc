import 'package:app/repositories/repositories.dart';
import 'package:app/simple_bloc_delegate.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'blocs/blocs.dart';
import 'widgets/widgets.dart';

void main(){
   BlocSupervisor.delegate = SimpleBlocDelegate();
   
  final MovieRepository movieRepository = MovieRepository(
    movieApiClient: MovieApiClient(
      httpClient: http.Client(),
    ),
  );
   runApp(App(movieRepository: movieRepository));
   }

class App extends StatelessWidget {
  final MovieRepository movieRepository;

  App({Key key, @required this.movieRepository})
      : assert(movieRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie',
      home: BlocProvider(
        create: (context) =>
            MovieBloc(movieRepository: movieRepository),
        child: MovieScreen(),
      ),
    );
  }
}