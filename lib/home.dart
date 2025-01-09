import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'detail.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<dynamic> _names = []; 
  List<dynamic> _filteredNames = [];
  bool _isLoading = true; 
  final TextEditingController _searchController = TextEditingController(); 

  Future<void> fetchNames() async {
    const url = 'https://jsonplaceholder.typicode.com/users'; 
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          _names = data;
          _filteredNames = data; 
          _isLoading = false; 
        });
      } else {
        throw Exception('Gagal memuat data');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Terjadi kesalahan: $e'),
      ));
    }
  }

  void _filterNames(String query) {
    final filteredNames = _names.where((name) {
      final nameLower = name['name'].toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();

    setState(() {
      _filteredNames = filteredNames;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchNames(); 
    _searchController.addListener(() {
      _filterNames(_searchController.text); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Cari Nama',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator()) 
                : ListView.builder(
                    itemCount: _filteredNames.length,
                    itemBuilder: (context, index) {
                      final name = _filteredNames[index]['name'] ?? 'No Name';
                      final email = _filteredNames[index]['email'] ?? 'No Email';
                      return ListTile(
                        title: Text(name),
                        subtitle: Text(email), 
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                name: name,
                                email: email,
                                phone: _filteredNames[index]['phone'] ?? 'No Phone',
                                website: _filteredNames[index]['website'] ?? 'No Website',
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
