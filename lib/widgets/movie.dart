import 'package:app/blocs/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/blocs/blocs.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Movie'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              BlocProvider.of<MovieBloc>(context).add(FecthMovie());
            },
          )
        ],
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('Fecth movie')),
                ),
                IconButton(
                  icon: Icon(Icons.cloud_download),
                  onPressed: () {
                    BlocProvider.of<MovieBloc>(context).add(FecthMovie());
                  },
                )
              ],
            );
          }
          if (state is MovieLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is MovieLoaded) {
            final movie = state.movie;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/' + movie.posterPath,
                      width: width / 3,
                    ),
                  ),
                  SizedBox(
                    height: height / 100,
                  ),
                  new Text(
                    movie.title.length > 20
                        ? movie.title.substring(0, 20).toUpperCase() + ' ...'
                        : movie.title.toUpperCase(),
                    overflow: TextOverflow.clip,
                    maxLines: 5,
                    style: new TextStyle(color: Colors.white70),
                  )
                ],
              ),
            );
          }
          if (state is MovieError) {
            return Text(
              'Something went wrong!',
              style: TextStyle(color: Colors.red),
            );
          }
        },
      ),
    );
  }
}
