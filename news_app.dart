import 'package:abdullaa/lay_out/news_app/cubit/cubit.dart';
import 'package:abdullaa/lay_out/news_app/cubit/states.dart';
import 'package:abdullaa/moduls/search/search_screen.dart';
import 'package:abdullaa/shared/compounant/compounts.dart';
import 'package:abdullaa/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class News_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer< newsappcubit,NewsappState>(
     listener: (context, state) {},
      builder: (context , state){
     var cubit=newsappcubit.get(context);
     return Scaffold(
       appBar: AppBar(
         bottom: PreferredSize(
           preferredSize: Size.fromHeight(15),
           child: Container(

           ),
         ),

         backgroundColor: Colors.black,
         title: Text(
           'News App',



         ),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(25),
             topRight: Radius.circular(25),
             bottomLeft: Radius.circular(25),
             bottomRight: Radius.circular(25),
           )
         ),

         actions: [

           IconButton(
               onPressed:(){
                 navigateTo(context, SearchScreen());
               },
               icon: Icon(
                 Icons.search,
                 size: 30,
               )
           ),
         ],
       ),
       bottomNavigationBar:Container(

         color: Colors.black,
         child: Padding(
           padding: const EdgeInsets.symmetric(
             horizontal: 15,
             vertical: 20,
           ),
           child: GNav(
             backgroundColor: Colors.black,
             color: Colors.white,
             activeColor: Colors.white,
             tabBackgroundColor: Colors.grey.shade800,
             gap: 8,
             // currentIndex: cubit.currentIndex,
             onTabChange: (index){
               cubit.changeNavbar(index);
             },

  padding: EdgeInsets.all(20),

             tabs:[

               GButton
                 (icon: Icons.business,
                 text: 'Business',
               ),
               GButton(icon: Icons.sports,
                 text: 'Sports',
               ),
               GButton(icon: Icons.science,
                 text: 'Science',
               ),
               GButton(icon: Icons.health_and_safety,
                 text: 'Health',
               ),
             ],

           ),
         ),
       ),

       // BottomNavigationBar(
       //
       //   currentIndex: cubit.currentIndex,
       //   onTap: (index){
       //     cubit.changeNavbar(index);
       //   },
       //   items:cubit.bottomItems,
       // ),
       body: cubit.screens[cubit.currentIndex],
     );
      },

    );
  }
}
