import 'package:flutter/material.dart';
import 'package:ofppt_project/pages/pages_App/agendapage/pagesmodel/infstracture/pagedowlandreaseau.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Infstracture extends StatefulWidget {
  const Infstracture({super.key});

  @override
  State<Infstracture> createState() => _InfstractureState();
}

class _InfstractureState extends State<Infstracture> {
   final _stream = Supabase.instance.client.from('infstracture01').stream(primaryKey: ['id']);
    final _stream2 = Supabase.instance.client.from('infstracture02').stream(primaryKey: ['id']);
  String _selectedOption = '1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              height: 65,
              child: DropdownButton<String>(
                value: _selectedOption,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedOption = value;
                    });
                  }
                },
                items: const [
                  DropdownMenuItem(value: '1', child: Text('First Year')),
                  DropdownMenuItem(value: '2', child: Text('Second Year')),
                ],
              ),
            ),
          ),
          
          // if the select value was 2 we display class of the second year 
          if (_selectedOption == '2')
            Expanded(
              child: StreamBuilder<List<Map<String, dynamic>>>(
                stream: _stream2,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
    
                  final classes = snapshot.data!;
    
                  return ListView.builder(
                    itemCount: classes.length,
                    itemBuilder: (context, index) {
                      final class1 = classes[index];
                      final col = class1['nameclass'];
    
                      return Column(
                        children: [
                          GestureDetector(
                             onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>Pagedowlandreaseau(classname: col)));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 15),
                              width: double.infinity,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(64, 158, 158, 158),
                              ),
                              child: Center(
                                child: Text(col),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          
          // if the select value was 2 we display class of the first year 
          if (_selectedOption == '1')
            Expanded(
              child: StreamBuilder<List<Map<String, dynamic>>>(
                stream: _stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
    
                  final classes = snapshot.data!;
    
                  return ListView.builder(
                    itemCount: classes.length,
                    itemBuilder: (context, index) {
                      final class1 = classes[index];
                      final col = class1['nameclass'];
                      
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Pagedowlandreaseau(classname: col)));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 15),
                              width: double.infinity,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(64, 158, 158, 158),
                              ),
                              child: Center(
                                child: Text(col),
                              ),
                            ),
                          )
                        ],
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