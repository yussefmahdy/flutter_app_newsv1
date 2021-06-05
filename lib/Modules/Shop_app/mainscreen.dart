import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopCubit.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopStates.dart';
import 'package:flutter_app_newsv1/models/shop_app/categories_model.dart';
import 'package:flutter_app_newsv1/models/shop_app/home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class MainScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit()..getHome(),
      child: BlocConsumer<ShopCubit,ShopStates>(
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
              body: SingleChildScrollView(
                child: ConditionalBuilder(
                  condition: ShopCubit.get(context).homeData != null,
                  builder: (context) => Column(
                    children: [
                      Container(
                        height: 200.0,
                        width: double.infinity,
                        child: ListView.builder(
                          // scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index) => buildHomeItemBanners(context,ShopCubit.get(context).homeData.data.banners[index]),
                          itemCount: 1,//HomeCubit.get(context).homeData.data.banners.length

                        ),
                      ) ,



                      // Text(
                      //   "Categories",
                      //   textAlign: TextAlign.start,
                      //   style: TextStyle(
                      //       fontSize: 20.0
                      //   ),
                      // ),
                      // Row(
                      //   children: [
                      //     SingleChildScrollView(
                      //       scrollDirection: Axis.horizontal,
                      //       child: Expanded(
                      //         child: ListView.builder(
                      //           itemBuilder: (context,index) => buildHomeItemCateg(context,CategCubit.get(context).CategVarData.data.categories[index]),
                      //           itemCount: CategCubit.get(context).CategVarData.data.categories.length,
                      //
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ) ,



                      Text(
                          "New Products",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20.0
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context,index) => buildGridProduct(context,ShopCubit.get(context).homeData.data.products[index]),
                        itemCount: ShopCubit.get(context).homeData.data.products.length,

                      ) ,
                    ],
                  ),
                  fallback: (context) =>  Center(
                      child: CircularProgressIndicator()
                  ),
                ),
              ),

            );

        },

      ),
    );
  }




  Widget buildHomeItemBanners(context,BannersData model,) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      // height: 120.0,
      width: 200.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          // image
          CarouselSlider(
            items:[
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("https://student.valuxapps.com/storage/uploads/banners/1619472116OYHxC.45b7de97376281.5ec3ca8c1d324.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("https://student.valuxapps.com/storage/uploads/banners/1619501214k9Xz9.banner_foods.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            ],

            //Slider Container properties
            options: CarouselOptions(
              //height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,

            ),
          ),
        ],
      ),
    ),
  );


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


  // Widget buildHomeItemProducts(context,ProductsData model) => Padding(
  //   padding: const EdgeInsets.all(20.0),
  //     child: Container(
  //       height: 120.0,
  //       width: 200.0,
  //       child: Row(
  //         children:
  //         [
  //
  //
  //           // image
  //           Container(
  //             width: 120.0,
  //             height: 120.0,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(
  //                 10.0,
  //               ),
  //               image: DecorationImage(
  //                 image: NetworkImage(
  //                   model.image
  //                 ),
  //                 //fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //
  //
  //           SizedBox(
  //             width: 20.0,
  //           ),
  //
  //           // texts
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   model.name,
  //                   maxLines: 3,
  //                   overflow: TextOverflow.ellipsis,
  //                   style: Theme.of(context).textTheme.subtitle1,
  //                 ),
  //                 Spacer(),
  //                 Row(
  //                   children: [
  //                     //
  //                     // if (model.price < model.oldPrice)
  //                     SizedBox(
  //                       height: 20.0,
  //                     ),
  //                           Container(
  //                             child: Text(
  //                                 'EGP ${model.price}',
  //                                   style: TextStyle(
  //                                   fontSize: 12.0,
  //
  //                                   color: Colors.green,
  //                                 ),
  //                               ),
  //                           ),
  //
  //                     SizedBox(
  //                         width:5.0,
  //                     ),
  //                     if (model != null && model.price != null && model.oldPrice != null && model.price < model.oldPrice)
  //                       Text(
  //                           'EGP ${model.oldPrice}',
  //                           style: TextStyle(
  //                             decoration: TextDecoration.lineThrough,
  //                             fontSize: 12.0,
  //                             color: Colors.red,
  //                           ),
  //                         ),
  //                     Spacer(),
  //
  //                     Align(
  //                       // alignment: Alignment.centerRight,
  //                       child: IconButton(
  //
  //                         onPressed: ()
  //                         {
  //                           navigateTo(context: context, widget: FavoritesScreen(),);
  //                         },
  //                         icon: Icon(
  //                           Icons.favorite,
  //                           color: Colors.blue,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //
  //                 ),
  //
  //                 Container(child: myDivider())
  //
  //
  //               ],
  //             ),
  //           ),
  //
  //         ],
  //       ),
  //
  //
  //
  //     ),
  //
  // );

  Widget buildGridProduct(context ,ProductsData model) => Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(model.image),
              width: double.infinity,
              height: 200.0,
            ),
            if (model.discount != 0)
              Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(
                  horizontal: 5.0,
                ),
                child: Text(
                  'DISCOUNT',
                  style: TextStyle(
                    fontSize: 8.0,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  height: 1.3,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${model.price.round()}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  if (model.discount != 0)
                    Text(
                      '${model.oldPrice.round()}',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                       ShopCubit.get(context).changeFavorites(model.id);
                      // print(model.id);
                    },
                    icon: CircleAvatar(
                      radius: 15.0,
                      backgroundColor:
                      ShopCubit.get(context).favorites[model.id]
                          ? Colors.teal
                          : Colors.grey,
                      child: Icon(
                        Icons.favorite_border,
                        size: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

  // Widget buildGridProduct(ProductsData model, context) => Container(
  //   color: Colors.white,
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children:
  //     [
  //       Stack(
  //         alignment: AlignmentDirectional.bottomStart,
  //         children: [
  //           Image(
  //             image: NetworkImage(model.image),
  //             width: double.infinity,
  //             height: 200.0,
  //           ),
  //           if (model.discount != 0)
  //             Container(
  //               color: Colors.red,
  //               padding: EdgeInsets.symmetric(
  //                 horizontal: 5.0,
  //               ),
  //               child: Text(
  //                 'DISCOUNT',
  //                 style: TextStyle(
  //                   fontSize: 8.0,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ),
  //         ],
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(12.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children:
  //           [
  //             Text(
  //               model.name,
  //               maxLines: 2,
  //               overflow: TextOverflow.ellipsis,
  //               style: TextStyle(
  //                 fontSize: 14.0,
  //                 height: 1.3,
  //               ),
  //             ),
  //             Row(
  //               children: [
  //                 Text(
  //                   '${model.price.round()}',
  //                   style: TextStyle(
  //                     fontSize: 12.0,
  //                     color: Colors.teal,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: 5.0,
  //                 ),
  //                 if (model.discount != 0)
  //                   Text(
  //                     '${model.oldPrice.round()}',
  //                     style: TextStyle(
  //                       fontSize: 10.0,
  //                       color: Colors.grey,
  //                       decoration: TextDecoration.lineThrough,
  //                     ),
  //                   ),
  //                 Spacer(),
  //                 IconButton(
  //                   onPressed: ()
  //                   {
  //                     ShopCubit.get(context).changeFavorites(model);
  //                     // print(model.id);
  //                   },
  //                   icon: CircleAvatar(
  //                     radius: 15.0,
  //                     backgroundColor:
  //                     ShopCubit.get(context).favorites[model.id]
  //                         ? Colors.teal
  //                         : Colors.grey,
  //                     child: Icon(
  //                       Icons.favorite_border,
  //                       size: 14.0,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   ),
  // );
}



