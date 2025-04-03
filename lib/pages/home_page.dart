import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/components/categories.dart';
import 'package:flutter_application_1/components/navbar.dart';
import 'package:flutter_application_1/components/recommendations.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
  void sign_out() async{
    try {
      await FirebaseAuth.instance.signOut();
      print('User signed out');
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/login_page');
    } 
    catch (e) {
      print('Failed to sign out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Color myColor = Color(0xFF9AA8AB);
    return Scaffold(
      backgroundColor: Color(0xFF9AA8AB),
      appBar: AppBar(
        backgroundColor: myColor,
        title: const Text(
      "REVALUE",style:TextStyle(
        fontSize: 20,color:Color(0xFF05141B),fontWeight: FontWeight.bold,shadows: [
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 0, 0, 0),
            )])
            ),
        actions: [
          IconButton(icon: const Icon(Icons.logout),
          onPressed:() {
            sign_out();
          },
          )
        ],     
      ),
      bottomNavigationBar: Nav_Bar(),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:25,left: 10,bottom: 25,right:25),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color(0xFFCCD0CF),borderRadius: BorderRadius.circular(15)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Search"),
                        Icon(Icons.search)
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Icon(Icons.notification_add)
              ],
            ),
          ),
          
          const Categories(), 

          const Recommendations(),


        ],
      ),   
    );
  }
}