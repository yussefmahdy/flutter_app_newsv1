import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Search/HomeSearchScreen.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopCubit.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopStates.dart';
import 'package:flutter_app_newsv1/Shared/Components/Components.dart';
import 'package:flutter_app_newsv1/models/shop_app/categories_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget
{


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state){},
      builder: (context, state){
        return Scaffold(
          drawer: Drawer(

            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Yussef Mahdy",
                    style: TextStyle(
                      fontSize: 15.0,

                    ),
                  ),
                  Text(
                    "Yussef Info",
                    style: TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  ConditionalBuilder(
                    condition: ShopCubit.get(context).CategVarData != null,
                    builder: (context) => Expanded(
                      child: ListView.builder(
                        itemBuilder: (context,index) => buildDrawerItemCateg(context,ShopCubit.get(context).CategVarData.data.categories[index]),
                        itemCount: ShopCubit.get(context).CategVarData.data.categories.length,

                      ),
                    ) ,//he cant enter here because it is null
                    fallback: (context) =>  Center(
                        child: CircularProgressIndicator() // Loader
                    ),
                  ),

                  Text(
                    "Help & Info",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  myDivider(),
                  Row(
                    children: [
                      Container(
                              width: 120.0,
                              height: 40.0,
                              child: Icon(
                                  Icons.cast
                              ),
                            ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Blog",

                            // maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                            ),


                          ),

                        ],
                      ),

                    ],
                  ),
                  myDivider(),
                  Row(
                    children: [
                      Container(
                        width: 120.0,
                        height: 40.0,
                        child: Icon(
                            Icons.error
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "About us",

                            // maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                            ),


                          ),

                        ],
                      ),

                    ],
                  ),
                  myDivider(),
                  Row(
                    children: [
                      Container(
                        width: 120.0,
                        height: 40.0,
                        child: Icon(
                            Icons.alternate_email_sharp
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Contact us",

                            // maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                            ),


                          ),

                        ],
                      ),

                    ],
                  ),
                  myDivider(),
                  Row(
                    children: [
                      Container(
                        width: 120.0,
                        height: 40.0,
                        child: Icon(
                            Icons.privacy_tip_outlined
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Terms & Condition",

                            // maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                            ),


                          ),

                        ],
                      ),

                    ],
                  ),
                  myDivider(),
                  Row(
                    children: [
                      Container(
                        width: 120.0,
                        height: 40.0,
                        child: Icon(
                            Icons.album_outlined
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Faqs",

                            // maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                            ),


                          ),

                        ],
                      ),

                    ],
                  ),
                  myDivider(),
                  Row(
                    children: [
                      Container(
                        width: 120.0,
                        height: 40.0,
                        child: Icon(
                            Icons.privacy_tip_outlined
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Privacy policies",

                            // maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                            ),


                          ),

                        ],
                      ),

                    ],
                  ),
                  myDivider(),
                  Row(
                    children: [
                      Container(
                        width: 120.0,
                        height: 40.0,
                        child: Icon(
                            Icons.insert_drive_file
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Careers",

                            // maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                            ),


                          ),

                        ],
                      ),

                    ],
                  ),
                  myDivider(),
                  Row(
                    children: [
                      Container(
                        width: 120.0,
                        height: 40.0,
                        child: Icon(
                            Icons.device_hub
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Servers",

                            // maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                            ),


                          ),

                        ],
                      ),

                    ],
                  ),
                  myDivider(),




                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: Text(
              ShopCubit.get(context).titles[ShopCubit.get(context).currentIndex],
            ),
            actions: [
              IconButton(
                onPressed: ()
                {
                  navigateReplaceTo(context: context, widget: HomeSearchScreen(),);
                },
                icon: Icon(
                  Icons.search,
                ),
              ),


            ],
          ),
          body: ShopCubit.get(context).screens[ShopCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: ShopCubit.get(context).currentIndex,
            onTap: (index)
            {
              ShopCubit.get(context).changeIndex(index);
            },
            items:
            [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',

              ),
              BottomNavigationBarItem(

                icon: Icon(
                  Icons.category,
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildDrawerItemCateg(context ,CategListData Categmodel,) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 38.0,
      width: 200.0,
      child: Row(
        children:
        [


          // image
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                65.0,
              ),
              image: DecorationImage(
                image: NetworkImage(
                    Categmodel.image
                ),
                //fit: BoxFit.cover,
              ),
            ),
          ),


          SizedBox(
            width: 20.0,
          ),

          // texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 40.0,
                // ),
                Text(
                  Categmodel.name,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Spacer(),
                // Row(
                //   children: [
                //     //
                //     // if (model.price < model.oldPrice)
                //     SizedBox(
                //       height: 20.0,
                //     ),
                //     Container(
                //       child: Text(
                //         'EGP ${model.}',
                //         style: TextStyle(
                //           fontSize: 12.0,
                //
                //           color: Colors.green,
                //         ),
                //       ),
                //     ),
                //
                //     SizedBox(
                //       width:5.0,
                //     ),
                //     if (model != null && model.price != null && model.oldPrice != null && model.price < model.oldPrice)
                //       Container(
                //         child: Text(
                //           'EGP ${model.oldPrice}',
                //           style: TextStyle(
                //             decoration: TextDecoration.lineThrough,
                //             fontSize: 12.0,
                //             color: Colors.red,
                //           ),
                //         ),
                //       ),
                //
                //
                //     IconButton(
                //       onPressed: ()
                //       {
                //         //navigateTo(context: context, widget: HomeSearchScreen(),);
                //       },
                //       icon: Icon(
                //         Icons.favorite,
                //         color: Colors.blue,
                //       ),
                //     ),
                //   ],
                //
                // ),

              ],
            ),
          ),

          Icon(
              Icons.chevron_right
          ),


        ],
      ),



    ),

  );
}
