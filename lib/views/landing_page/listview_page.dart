import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  const ListviewPage({super.key});

  @override
  State<ListviewPage> createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:AppBar(title: Center(child: Text('List view',textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
    backgroundColor: Colors.lightBlue,) ,
body: Column(
  children: [
  
     Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
          itemCount: 100,
          itemBuilder: (
          BuildContext context,int i
        ){ return Container(
          margin: const EdgeInsets.symmetric(vertical: 6.0),
                      decoration: BoxDecoration(
                        color: Colors.white, // <-- alag color
                        borderRadius: BorderRadius.circular(15),
                      ),
          child: ListTile(
          // minVerticalPadding: 30,
          // tileColor: Colors.blue,
            leading: Text('$i)'),
            title: Text(' Creative $i'),
            trailing: Icon(Icons.hearing),
            subtitle: Text('List 1'),
          ),
        );
        
        }),
        
        ),
  ),
 ),






      Expanded(
        child: Row(
          children: [
          Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 32, 255, 7),
                    borderRadius: BorderRadius.circular(15),
                  ),
              child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
              itemCount: 100,
              itemBuilder: (
              BuildContext context,int i
            ){ return Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0),
                      decoration: BoxDecoration(
                        color: Colors.white, // <-- alag color
                        borderRadius: BorderRadius.circular(15),
                      ),
              child: ListTile(
              // minVerticalPadding: 30,
              // tileColor: Colors.blue,
                leading: Text('$i'),
                title: Text(' Pro $i'),
                subtitle: Text('List 2'),
              ),
            );
            
            }),
            
            ),
            ),
           ),
        
        
        
        
        
        Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 1, 162),
            borderRadius: BorderRadius.circular(10),
          ),
            child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (
            BuildContext context,int i
          ){ return Container(
            margin: const EdgeInsets.symmetric(vertical: 6.0),
                      decoration: BoxDecoration(
                        color: Colors.white, // <-- alag color
                        borderRadius: BorderRadius.circular(15),
                      ),
            child: ListTile(
            // minVerticalPadding: 30,
            // tileColor: Colors.blue,
                    leading: Text('$i'),
                    title: Text(' hi $i'),
                    subtitle: Text('List 3'),
            ),
          );
          
          }),
          
          ),
          ),
         ),
        
        ],),
      ),


Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 238, 107, 107),
          borderRadius: BorderRadius.circular(15),
        ),
    child: Padding(
padding: const EdgeInsets.all(12.0),
child: ListView.builder(
    itemCount: 100,
    itemBuilder: (
    BuildContext context,int i
  ){ return Container(
    margin: const EdgeInsets.symmetric(vertical: 6.0),
                      decoration: BoxDecoration(
                        color: Colors.white, // <-- alag color
                        borderRadius: BorderRadius.circular(10),
                      ),
    child: ListTile(
    // minVerticalPadding: 30,
    // tileColor: Colors.blue,
      leading: Text('$i'),
      title: Text(' hello $i'),
      trailing: Icon(Icons.add_road_rounded),
      subtitle: Text('List 4'),
    ),
  );
  
  }),
  
  ),
  ),
 ) 
 
 
 
 
  ],
) 
    );
  }
}