import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../models/user.dart';
import '../services/database_helper.dart';
import '../services/session.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? _currentUser;
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final SessionService _sessionService = SessionService();
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final username = await _sessionService.getSession();
    if (username != null) {
      final user = await _databaseHelper.getUser(username);
      setState(() {
        _currentUser = user;
        _passwordController.text = user?.password ?? '';
      });
    }
  }

  Future<void> _updateProfilePicture() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final user = _currentUser;
      if (user != null) {
        user.profilePicture = pickedFile.path;
        await _databaseHelper.updateUser(user);
        setState(() {
          _currentUser = user;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile picture updated successfully')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        titleTextStyle: TextStyle(fontSize: 30, color: Colors.white),
        backgroundColor: Colors.brown,
      ),
      backgroundColor: const Color.fromRGBO(25, 25, 25, 25),
      body: _currentUser == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CircleAvatar(
                    radius: 130,
                    backgroundImage: _currentUser!.profilePicture == null
                        ? AssetImage('assets/default_profile.jpg')
                        : FileImage(File(_currentUser!.profilePicture!))
                            as ImageProvider,
                  ),
                  TextButton(
                    onPressed: _updateProfilePicture,
                    child: Text(
                      'Change Profile Picture',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: _currentUser!.username,
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    readOnly: true,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
    );
  }
}
