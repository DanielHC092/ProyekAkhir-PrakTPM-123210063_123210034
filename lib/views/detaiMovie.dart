import 'package:flutter/material.dart';
import 'package:proyek_mobile_danielhanselc_123210063/models/DetailUserModel.dart';
import 'package:proyek_mobile_danielhanselc_123210063/views/pembelianMovie.dart';

class DetailMovie extends StatelessWidget {
  final Movie movieData;

  const DetailMovie({Key? key, required this.movieData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          "Detail Movie: ${movieData.title}",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: _buildDetailMovie(context, movieData),
      ),
    );
  }

  Widget _buildDetailMovie(BuildContext context, Movie movieData) {
    return Container(
      color: const Color.fromRGBO(25, 25, 25, 25),
      child: Center(
        child: Card(
          color: Colors.grey[900],
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (movieData.poster != null)
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.network(movieData.poster!),
                  ),
                if (movieData.title != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movieData.title!,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                if (movieData.year != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movieData.year!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                if (movieData.rated != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movieData.rated!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                if (movieData.genre != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movieData.genre!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                if (movieData.runtime != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movieData.runtime!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                if (movieData.release != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movieData.release!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                if (movieData.plot != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movieData.plot!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                if (movieData.actors != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movieData.actors!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                if (movieData.rating != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movieData.rating!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                if (movieData.award != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movieData.award!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PurchaseDetailPage(movieData: movieData)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.brown,
                  ),
                  child: Text('Buy'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
