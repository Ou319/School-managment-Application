import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Stream for getting text
  final _stream01 =
      Supabase.instance.client.from('post_text').stream(primaryKey: ['id']);
  final stream02 =
      Supabase.instance.client.from('post_img_text').stream(primaryKey: ['id']);

  String _searchQuery = ''; //****** here we save value of the input textfield

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(
                  top: 50, bottom: 20, left: 10, right: 10),
              padding:
                  const EdgeInsets.only(left: 10, top: 25, bottom: 25, right: 25),
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade100,
              ),
              child: Center(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value; //****** chnage the value of text on change  
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search, color: Colors.black),
                    hintText: 'Search...',
                    hintStyle: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),

          // Share just text
          StreamBuilder<List<Map<String, dynamic>>>(
            stream: _stream01,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              //******see if we have any text 
              final textes = snapshot.data!
                  .where((texte) =>
                      texte['text']
                          .toString()
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase()))
                  .toList();

              return Column(
                children: textes.reversed.map((texte) {
                  final colText = texte['text'];
                  final time = texte['created_at'].toString();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: const Color.fromARGB(208, 184, 182, 182),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                "https://seeklogo.com/images/O/ofppt-logo-B2CAD4E136-seeklogo.com.png",
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "OFPPT ETABLISSEMENT",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  time,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 15),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          colText,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              );
            },
          ),

          Container(
            width: double.infinity,
            height: 2,
            color: const Color.fromARGB(195, 201, 201, 201),
          ),

          // Share: Text and Image from stream02
          StreamBuilder<List<Map<String, dynamic>>>(
            stream: stream02,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              //*****see if we have any text
              final posts = snapshot.data!
                  .where((post) =>
                      post['text']
                          .toString()
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase()))
                  .toList();

              return Column(
                children: posts.reversed.map((post) {
                  final colText = post['text'];
                  final colImg = post['img'];
                  final time = post['created_at'].toString();

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: const Color.fromARGB(208, 184, 182, 182),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                "https://seeklogo.com/images/O/ofppt-logo-B2CAD4E136-seeklogo.com.png",
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "OFPPT ETABLISSEMENT",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  time,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              colText,
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.black87,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                colImg,
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              );
            },
          ),

          Container(
            width: double.infinity,
            height: 2,
            color: const Color.fromARGB(195, 201, 201, 201),
          ),
        ],
      ),
    );
  }
}
