import 'package:flutter/material.dart';
import 'package:proyek_mobile_danielhanselc_123210063/models/DetailUserModel.dart';
import 'package:proyek_mobile_danielhanselc_123210063/views/detaiMovie.dart';
import 'package:proyek_mobile_danielhanselc_123210063/views/login_page.dart';
import 'package:proyek_mobile_danielhanselc_123210063/views/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../apiDataSource.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  final TextEditingController _searchController = TextEditingController();
  Future<Movie>? _futureDetailUser;
  int _selectedIndex = 0;

  void _searchMovie() {
    setState(() {
      _futureDetailUser = ApiDataSource.instance
          .loadDetailUser(_searchController.text) as Future<Movie>?;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
      case 2:
        _logout(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Movie"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        backgroundColor: Colors.brown,
      ),
      backgroundColor: const Color.fromRGBO(25, 25, 25, 25),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter movie title',
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _searchMovie,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _futureDetailUser == null
                  ? const Center(
                      child: Text('Enter a movie title to search',
                          style: TextStyle(color: Colors.white)))
                  : FutureBuilder<Movie>(
                      future: _futureDetailUser,
                      builder: (BuildContext context,
                          AsyncSnapshot<Movie> snapshot) {
                        if (snapshot.hasError) {
                          return _buildError(snapshot.error.toString());
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return _buildLoading();
                        }
                        if (snapshot.hasData) {
                          final detailUser = snapshot.data!;
                          return _buildSuccess(context, detailUser);
                        }
                        return _buildError('No data found');
                      },
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
        child: Text("Error: $message", style: TextStyle(color: Colors.white)));
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccess(BuildContext context, Movie data) {
    return Center(
      child: Card(
        elevation: 4,
        color: Colors.grey[800],
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailMovie(movieData: data),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (data.poster != null)
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.network(data.poster!),
                ),
              if (data.title != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(data.title!,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              if (data.year != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text(data.year!, style: TextStyle(color: Colors.white)),
                ),
              if (data.rated != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text(data.rated!, style: TextStyle(color: Colors.white)),
                ),
              if (data.genre != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text(data.genre!, style: TextStyle(color: Colors.white)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
