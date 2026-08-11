import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore =
        FirebaseFirestore.instance.collection('student').snapshots();

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: AppBar(
        title: const Text('Student list'),
        backgroundColor: const Color(0xff667EEA),
        foregroundColor: Colors.white,
      ),

      body: StreamBuilder(
        stream: firestore,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final email = FirebaseAuth.instance.currentUser?.email;

          final students = snapshot.data!.docs.where((student) => student['email'] != email).toList();

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: students.length,
            itemBuilder: (context, index) {
          
          final student = students[index];

              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundColor: const Color(0xff667EEA),
                    child: Text(
                      student['name'][0].toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  title: Text( student['name'] ?? 'No Name', style: const TextStyle(fontWeight: FontWeight.bold,),),

                  subtitle: Text( '${student['email']}\n${student['phone']}',),

                  trailing: Text(
                    student['bloodGroup'] ?? 'N/A',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
// body: SafeArea(
//   child: CustomScrollView(
//      slivers: [
//      SliverAppBar.large(title: Text('Welcome',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
//      backgroundColor: Colors.indigo, expandedHeight: 150,
//      ),
  
//   // SliverToBoxAdapter(child: CustomTextWidget(text: widget.email??'', color: Colors.cyan, fontSize: 40, fontWeight: FontWeight.w400)),

//   SliverFillRemaining (
//     child: Column(
//       children: [
//      Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                       color: Colors.amber,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: ListView.builder(
//                               itemCount: arrName.length,
//                               itemBuilder: (
//                               BuildContext context,int i
//                             ){ return Container(
//                               margin: const EdgeInsets.symmetric(vertical: 6.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white, 
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                               child: ListTile(
//                               // minVerticalPadding: 30,
//                               // tileColor: Colors.blue,
//                   leading: Text('$i)'),
//                   title: Text(arrName[i]),
//                   trailing: Icon(Icons.hearing),
//                   subtitle: Text('List 1'),
//                               ),
//                             );
                            
//                             }),
                            
//                             ),
//                       ),
//                 ),
//      ),
    
    
    
    
    
    
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                 Expanded(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                           color: const Color.fromARGB(255, 32, 255, 7),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                     child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: ListView.builder(
//                     itemCount: 100,
//                     itemBuilder: (
//                     BuildContext context,int i
//                   ){ return Container(
//                     margin: const EdgeInsets.symmetric(vertical: 6.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white, 
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                     child: ListTile(
//                     // minVerticalPadding: 30,
//                     // tileColor: Colors.blue,
//                       leading: Text('$i'),
//                       title: Text(' Pro $i'),
//                       subtitle: Text('List 2'),
//                     ),
//                   );
                  
//                   }),
                  
//                   ),
//                   ),
//                  ),
              
//               SizedBox(
//                 width: 7,
  
//               ),
              
              
              
//               Expanded(
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 255, 1, 162),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                   child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: ListView.builder(
//                   itemCount: 100,
//                   itemBuilder: (
//                   BuildContext context,int i
//                 ){ return Container(
//                   margin: const EdgeInsets.symmetric(vertical: 6.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white, 
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                   child: ListTile(
//                   // minVerticalPadding: 30,
//                   // tileColor: Colors.blue,
//                           leading: Text('$i'),
//                           title: Text(' hi $i'),
//                           subtitle: Text('List 3'),
//                   ),
//                 );
                
//                 }),
                
//                 ),
//                 ),
//                ),
              
//               ],),
//             ),
//           ),
    
    
//     Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 238, 107, 107),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//                   child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: ListView.builder(
//                   itemCount: 100,
//                   itemBuilder: (
//                   BuildContext context,int i
//                 ){ return Container(
//                   margin: const EdgeInsets.symmetric(vertical: 6.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white, 
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                   child: ListTile(
//                   minVerticalPadding: 5,
//                   // tileColor: Colors.blue,
//             leading: Text('$i'),
//             title: Text(' hello $i'),
//             trailing: Icon(Icons.add_road_rounded),
//             subtitle: Text('List 4'),
//                   ),
//                 );
                
//                 }),
                
//                 ),
//                 ),
//           ),
//      ) 
     
     
     
     
//       ],
//     ),
//   )
//     ]
  
        
  
//   ),
// ),

    
    );
  }
}