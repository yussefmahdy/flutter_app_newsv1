import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_newsv1/Layout/news_app/newsCubitPackage/newsCubit.dart';
import 'package:flutter_app_newsv1/Layout/news_app/newsCubitPackage/newsStates.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Search/SearchCubitPackage/homeSearchCubit.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Search/SearchCubitPackage/homeSearchStates.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopCubit.dart';
import 'package:flutter_app_newsv1/Modules/Shop_app/Shop_app_cubits/ShopStates.dart';
import 'package:flutter_app_newsv1/Shared/Components/Components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit(),
      child: BlocConsumer<ShopCubit,ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Search',
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    label: 'Search',
                    icon: Icons.search,
                    //onSubmit: (value)
                    //{
                    //  HomeSearchCubit.get(context).startSearch(value);
                    //},
                    onChange: (value)
                    {
                      ShopCubit.get(context).startSearch(value);
                    },
                  ),
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: state is! HomeSearchLoadingState,
                    builder: (context) => ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final cubit = ShopCubit.get(context);
                        return buildHomeItemProducts(context, cubit.searchData.data.search[index]);
                      } ,
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: ShopCubit?.get(context)?.searchData?.data?.search?.length ?? 0,
                    ),
                    fallback: (context) => Center(child: CircularProgressIndicator()),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}