import 'package:bookly/presentation_layer/business_logic/state/MovieState.dart';
import 'package:bookly/presentation_layer/screens/home_view/top_rated/top_rated_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/router.dart';
import '../../../core/utilities/color_constants.dart';
import '../../../core/utilities/text_styles.dart';
import '../../business_logic/cubit/book_cubit.dart';
import '../../widgets/home_app_bar.dart';
import '../../widgets/home_swiper.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kPrimaryColor,
      body: BlocConsumer<BookCubit, BookState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = BookCubit.get(context);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              const HomeSwiper(),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Books',
                      style: AppTextStyles.textStyle18,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.kSeeAllViewRoute);
                      },
                      child: Text(
                        'See All',
                        style: AppTextStyles.textStyle18
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              if (state is GetTopRatedLoadingState)
                const Expanded(
                    child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )),
              TopRatedListView(
                topRatedModel: cubit.topRatedModel,
              ),
            ],
          );
        },
      ),
    );
  }
}
