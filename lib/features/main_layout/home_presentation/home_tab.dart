import 'package:ecommerce_app/domain/di/di.dart';
import 'package:ecommerce_app/features/main_layout/home_presentation/cubit/home_tab_view_model.dart';
import 'package:ecommerce_app/features/main_layout/home_presentation/cubit/home_tab_view_model_state.dart';
import 'package:ecommerce_app/features/main_layout/home_presentation/widgets/ads_widget.dart';
import 'package:ecommerce_app/features/main_layout/home_presentation/widgets/custom_category_widget.dart';
import 'package:ecommerce_app/features/main_layout/home_presentation/widgets/custom_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModelCubit viewModel = getIt<HomeTabViewModelCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModelCubit, HomeTabViewModelState>(
        bloc: viewModel,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
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
                              list: viewModel.categoryList[index],
                            ),
                            itemCount: viewModel.categoryList.length,
                          ),
                        )
                      : CircularProgressIndicator(),
                  CustomSection(
                    sectionName: 'Brands',
                    function: () {},
                  ),
                  SizedBox(
                    height: 270.h,
                    child: Expanded(
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) => CustomCategoryWidget(
                          list: viewModel.brandsList[index],
                        ),
                        itemCount: viewModel.brandsList.length,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
