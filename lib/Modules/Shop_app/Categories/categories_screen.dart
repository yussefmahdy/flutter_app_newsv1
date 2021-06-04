
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Categories/categoriesCubitPackage/categCubit.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Categories/categoriesCubitPackage/categStates.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopCubit.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopStates.dart';
import 'package:flutter_app_newsv1/models/shop_app/categories_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit()..getCateg(),
      child: BlocConsumer<ShopCubit,ShopStates>(
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
            body: ConditionalBuilder(
              condition: ShopCubit.get(context).CategVarData != null,
              builder: (context) => Column(
                children: [

                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context,index) => buildHomeItemCateg(context,ShopCubit.get(context).CategVarData.data.categories[index]),
                      itemCount: ShopCubit.get(context).CategVarData.data.categories.length,

                    ),
                  ) ,
                ],
              ), //he cant enter here because it is null
              fallback: (context) =>  Center(
                  child: CircularProgressIndicator() // Loader
              ),
            ),

          );
        },

      ),
    );
  }


  Widget buildHomeItemCateg(context ,CategListData Categmodel,) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 120.0,
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
                35.0,
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
                SizedBox(
                  height: 40.0,
                ),
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