import 'package:ecommerce_app/features/main_layout/home_tab/widgets/ads_widget.dart';
import 'package:ecommerce_app/features/main_layout/home_tab/cubit/home_tab_view_model_cubit.dart';
import 'package:ecommerce_app/features/main_layout/home_tab/widgets/custom_category_widget.dart';
import 'package:ecommerce_app/features/main_layout/home_tab/widgets/custom_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModelCubit, HomeTabViewModelState>(
      bloc: HomeTabViewModelCubit.get(context)..getAllCategories(),
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AdsWidget(),
                  CustomSection(
                    sectionName: 'Categories',
                    function: () {},
                  ),
                  state is HomeCategorySuccessState
                      ? SizedBox(
                          height: 270.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) =>
                                CustomCategoryWidget(
                              list: HomeTabViewModelCubit.get(context)
                                  .categoryList[index],
                              product:
                                  HomeTabViewModelCubit.get(context).product,
                            ),
                            itemCount: HomeTabViewModelCubit.get(context)
                                .categoryList
                                .length,
                          ),
                        )
                      : CircularProgressIndicator(),
                  CustomSection(
                    sectionName: 'Brands',
                    function: () {},
                  ),
                  SizedBox(
                    height: 270.h,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) => CustomCategoryWidget(
                        list: HomeTabViewModelCubit.get(context)
                            .brandsList[index],
                        product: HomeTabViewModelCubit.get(context).product,
                      ),
                      itemCount:
                          HomeTabViewModelCubit.get(context).brandsList.length,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
