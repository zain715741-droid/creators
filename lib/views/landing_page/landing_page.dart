
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, this.password, this.email,});
  final String? password;
  final String? email;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
 var arrName=['Ali','Ahmad','Zain','Fahad','Akram','Ahsan','Murtaza'];

final firestore = FirebaseFirestore.instance.collection('student').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Center(
          child: StreamBuilder(stream: firestore, builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            final students = snapshot.data!.docs;
            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return ListTile(
                  leading: Text(student['bloodGroup'] ?? 'No bloodGroup'),
                  title: Text(student['name'] ?? 'No Name'),
                  subtitle: Text(students[index]['email'] ?? 'No email'),
                  trailing: Text(students[index]['phone'] ?? 'No phone'),
                  
                );
              }
            );
          })
        ),
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