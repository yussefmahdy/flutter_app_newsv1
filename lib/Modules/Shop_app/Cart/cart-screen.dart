import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopCubit.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        print("state is");
        print(state);
      },
      builder: (context, state)
      {

        var cartModel = ShopCubit.get(context).cartModel;

        return ConditionalBuilder(
          condition: cartModel != null,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 120.0,
                child: Row(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Image(
                          image: NetworkImage(cartModel.data.cartItems[index].product.image),
                          width: 120.0,
                          height: 120.0,
                        ),
                        //if (model.discount != 0 && isOldPrice)
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
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartModel.data.cartItems[index].product.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.0,
                              height: 1.3,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                cartModel.data.cartItems[index].product.price.toString(),
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.teal,
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              //if (model.discount != 0 && isOldPrice)
                                Text(
                                  cartModel.data.cartItems[index].product.oldPrice.toString(),
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  ShopCubit.get(context).changeCart(cartModel.data.cartItems[index].product.id);
                                },
                                icon: CircleAvatar(
                                  radius: 15.0,
                                  backgroundColor:
                                  ShopCubit.get(context).cart[cartModel.data.cartItems[index].product.id]
                                      ? Colors.teal
                                      : Colors.grey,
                                  child: Icon(
                                    Icons.remove_shopping_cart,
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
              ),
            ),
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
            itemCount: ShopCubit.get(context).cartModel.data.cartItems.length,
          ),
          fallback: (context) => Center(child: Text("Fall Back")),
        );
      },
    );
    // BlocConsumer<ShopCubit, ShopStates>(
    //   listener: (context, state) {},
    //   builder: (context, state)
    //   {
    //
    //     var favoritesModel = ShopCubit.get(context).favoritesModel;
    //
    //     return ConditionalBuilder(
    //       condition: favoritesModel != null,
    //       builder: (context) => ListView.separated(
    //         itemBuilder: (context, index) => buildListProduct(ShopCubit.get(context).favoritesModel.data.data[index].product, context),
    //         separatorBuilder: (context, index) => Container(
    //           width: double.infinity,
    //           height: 1.0,
    //           color: Colors.grey[300],
    //         ),
    //         itemCount: ShopCubit.get(context).favoritesModel.data.data.length,
    //       ),
    //       fallback: (context) => Center(child: CircularProgressIndicator()),
    //     );
    //   },
    // )
  }


  Widget buildListProduct(model, context, {
    bool isOldPrice = true,
  }) =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 120.0,
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.image),
                    width: 120.0,
                    height: 120.0,
                  ),
                  if (model.discount != 0 && isOldPrice)
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
              SizedBox(
                width: 20.0,
              ),
              Expanded(
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
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          model.price.toString(),
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.teal,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        if (model.discount != 0 && isOldPrice)
                          Text(
                            model.oldPrice.toString(),
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
        ),
      );
}




