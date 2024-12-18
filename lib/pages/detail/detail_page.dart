import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/helper/format_number.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/video_model.dart';
import 'package:movie_app/provider/comment_provider.dart';
import 'package:movie_app/provider/detail_provider.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:movie_app/provider/my_list_provider.dart';
import 'package:movie_app/provider/setting_app_provider.dart';
import 'package:movie_app/widgets/button_main_custom.dart';
import 'package:movie_app/widgets/loading/detail_loading.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailPage extends StatefulWidget {
  final int id;
  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isCheckFa = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    context.read<DetailProvider>().getDetail(widget.id);
    checkFa();
  }

  Future<void> checkFa() async {
    await context
        .read<MyListProvider>()
        .checkFavourite(context.read<SettingAppProvider>().uId, widget.id);
  }

  @override
  void dispose() {
    _tabController.dispose();
    // context.read<DetailProvider>().removeMovieDetail();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final detailProvider = context.watch<DetailProvider>();
    final movieDetail = detailProvider.movieDetail;

    print(movieDetail);

    return ChangeNotifierProvider(
        create: (context) => CommentProvider(),
        builder: (context, _) {
          return Scaffold(
            body: detailProvider.isLoading
                ? const DetailLoading()
                : SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Consumer<DetailProvider>(builder: (_, provider, __) {
                      return Column(
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                'https://image.tmdb.org/t/p/w500${movieDetail!.backdrop_path}',
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                top: 34.h,
                                left: 24.w,
                                right: 24.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.arrow_back),
                                    ),
                                    Image.asset(
                                      'assets/images/detail/Additional.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          24.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        movieDetail.title,
                                        style: SettingApp.heding1
                                            .copyWith(fontSize: 24.sp),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        String userId = context
                                            .read<SettingAppProvider>()
                                            .uId;
                                        int movieId = movieDetail.id;
                                        String backdropPath =
                                            provider.movieDetail!.backdrop_path;

                                        Provider.of<MyListProvider>(context,
                                                listen: false)
                                            .addToFavourites(
                                                userId, movieId, backdropPath);
                                      },
                                      child: Consumer<MyListProvider>(
                                        builder: (_, provider, __) {
                                          return Image.asset(
                                            'assets/images/detail/Bookmark.png',
                                            width: 20.w,
                                            height: 20.h,
                                            color: provider.checkListFa
                                                    .contains(widget.id)
                                                ? Colors.red
                                                : Colors.white,
                                          );
                                        },
                                      ),
                                    ),
                                    20.horizontalSpace,
                                    InkWell(
                                      onTap: () {
                                        Share.share(
                                            'https://img.youtube.com/vi/0.jpg');
                                      },
                                      child: Image.asset(
                                        'assets/images/detail/Send.png',
                                        width: 20.w,
                                        height: 20.h,
                                      ),
                                    ),
                                  ],
                                ),
                                20.verticalSpace,
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/detail/Star.png',
                                      width: 20.w,
                                      height: 20.h,
                                    ),
                                    8.horizontalSpace,
                                    Text(
                                      FormatNumber.hanldeFormat(
                                          movieDetail.vote_average),
                                      style: SettingApp.heding3.copyWith(
                                        fontSize: 12,
                                        color: SettingApp.colorText,
                                      ),
                                    ),
                                    8.horizontalSpace,
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: SettingApp.colorText,
                                      size: 16.sp,
                                    ),
                                    12.horizontalSpace,
                                    Text(
                                      movieDetail.release_date.substring(0, 4),
                                      style: SettingApp.heding2.copyWith(
                                        fontSize: 14.sp,
                                        color: const Color(0xffE0E0E0),
                                      ),
                                    ),
                                    12.horizontalSpace,
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6.h, horizontal: 10.w),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                        border: Border.all(
                                          color: SettingApp.colorText,
                                        ),
                                      ),
                                      child: Text(
                                        '13+',
                                        style: SettingApp.heding2.copyWith(
                                          fontSize: 10.sp,
                                          color: SettingApp.colorText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                20.verticalSpace,
                                Row(
                                  children: [
                                    Expanded(
                                      child: ButtonMainCustom(
                                        onTap: () {},
                                        paddingVertical: 8.h,
                                        isShowIconLeft: true,
                                        iconLeft: const Icon(Icons.play_circle),
                                        title: 'Play',
                                      ),
                                    ),
                                    8.horizontalSpace,
                                    Expanded(
                                      child: ButtonMainCustom(
                                        onTap: () {},
                                        paddingVertical: 9.h,
                                        isShowIconLeft: true,
                                        iconLeft: Image.asset(
                                            'assets/images/detail/Download.png'),
                                        title: 'Download',
                                        backgroundColor: Colors.transparent,
                                        borderWidth: 2,
                                      ),
                                    ),
                                  ],
                                ),
                                20.verticalSpace,
                                Text(
                                  'Genre: ${movieDetail.genres.map((g) => g.name).join(', ')}',
                                  style: SettingApp.heding3
                                      .copyWith(fontSize: 12.sp),
                                ),
                                8.verticalSpace,
                                ReadMoreText(
                                  movieDetail.overview,
                                  trimMode: TrimMode.Line,
                                  trimLines: 3,
                                  colorClickableText: const Color(0xffE21221),
                                  trimCollapsedText: 'View more',
                                  trimExpandedText: 'Show less',
                                  moreStyle: SettingApp.heding3.copyWith(
                                      fontSize: 12,
                                      color: SettingApp.colorText),
                                ),
                                20.verticalSpace,
                                TabBar(
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller: _tabController,
                                  tabs: const [
                                    Tab(text: 'Trailers'),
                                    Tab(text: 'More Like This'),
                                    Tab(text: 'Comments'),
                                  ],
                                  labelColor: SettingApp.colorText,
                                  indicatorColor: SettingApp.colorText,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 300.h,
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _tabController,
                              children: [
                                FutureBuilder(
                                  future:
                                      provider.getMovieTrailer(movieDetail.id),
                                  initialData: const [],
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    List<VideoModel> data =
                                        snapshot.data as List<VideoModel>;
                                    return ListView.separated(
                                      itemCount: data.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          height: 12.h,
                                        );
                                      },
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        // moi bo phim

                                        return InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              RouterName.videoPage,
                                              arguments: data[index],
                                            );
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 24.w),
                                            child: AspectRatio(
                                              aspectRatio: 380 / 113,
                                              child: Row(
                                                children: [
                                                  20.horizontalSpace,
                                                  Expanded(
                                                    child: Hero(
                                                      tag: data[index].key,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                              'https://img.youtube.com/vi/${data[index].key}/0.jpg',
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  20.horizontalSpace,
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          data[index].name,
                                                          style: SettingApp
                                                              .heding1
                                                              .copyWith(
                                                                  fontSize: 18),
                                                          maxLines: 1,
                                                        ),
                                                        12.verticalSpace,
                                                        Text(
                                                          data[index].site,
                                                          style: SettingApp
                                                              .heding2
                                                              .copyWith(
                                                                  fontSize: 14),
                                                        ),
                                                        12.verticalSpace,
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10.w,
                                                                  vertical:
                                                                      6.h),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.r)),
                                                          child: Text(
                                                            'Update',
                                                            style: SettingApp
                                                                .heding2
                                                                .copyWith(
                                                                    fontSize:
                                                                        10,
                                                                    color: SettingApp
                                                                        .colorText),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Consumer<HomeProvider>(
                                  builder: (__, provider, _) {
                                    List<MovieModel> data =
                                        provider.listMovieNowPlaying;
                                    return GridView.builder(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 24,
                                        childAspectRatio: 168 / 248,
                                      ),
                                      itemCount: data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              RouterName.movieDetail,
                                              arguments: {"id": data[index].id},
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  'https://image.tmdb.org/t/p/w500${data[index].poster_path}',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  blurRadius: 8,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Comments',
                                            style: SettingApp.heding1.copyWith(
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                RouterName.commentsPage,
                                                arguments: {'id': widget.id},
                                              );
                                            },
                                            child: Text(
                                              'See all',
                                              style:
                                                  SettingApp.heding2.copyWith(
                                                fontSize: 16.sp,
                                                color: SettingApp.colorText,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      16.horizontalSpace,

                                      // Sử dụng Expanded để ngăn danh sách mở rộng ngoài màn hình
                                      Expanded(
                                        child: StreamBuilder<QuerySnapshot>(
                                          stream: FirebaseFirestore.instance
                                              .collection('comment')
                                              .doc(widget.id.toString())
                                              .collection('userComment')
                                              .orderBy('time', descending: true)
                                              .limit(
                                                  4) // Giới hạn hiển thị  bình luận
                                              .snapshots(),
                                          builder: (context, snapshot) {
                                            if (!snapshot.hasData) {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }

                                            var comments = snapshot.data!.docs;

                                            return ListView.builder(
                                              itemCount: comments.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                var commentData =
                                                    comments[index].data()
                                                        as Map<String, dynamic>;

                                                return FutureBuilder<
                                                    DocumentSnapshot>(
                                                  future: FirebaseFirestore
                                                      .instance
                                                      .collection('users')
                                                      .doc(
                                                          commentData['userId'])
                                                      .get(),
                                                  builder:
                                                      (context, userSnapshot) {
                                                    if (userSnapshot
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return const SizedBox();
                                                    }
                                                    if (!userSnapshot.hasData ||
                                                        userSnapshot.hasError) {
                                                      return const Text(
                                                          'User not found');
                                                    }

                                                    var userData = userSnapshot
                                                            .data!
                                                            .data()
                                                        as Map<String, dynamic>;
                                                    String fullName = userData
                                                            .containsKey(
                                                                'userName')
                                                        ? userData['userName']
                                                        : 'Anonymous';

                                                    return Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: 48.w,
                                                              height: 48.h,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            1000.r),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  imageUrl:
                                                                      userData[
                                                                          'image'],
                                                                ),
                                                              ),
                                                            ),
                                                            16.horizontalSpace,
                                                            Expanded(
                                                              child: Text(
                                                                fullName,
                                                                style: SettingApp
                                                                    .heding1
                                                                    .copyWith(
                                                                        fontSize:
                                                                            16.sp),
                                                              ),
                                                            ),
                                                            Image.asset(
                                                              'assets/images/detail/MoreCircle.png',
                                                              color: const Color(
                                                                  0xffFFFFFF),
                                                              width: 18.w,
                                                              height: 18.h,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ],
                                                        ),
                                                        12.verticalSpace,
                                                        Text(
                                                          commentData[
                                                              'message'],
                                                          style: SettingApp
                                                              .heding4,
                                                        ),
                                                        12.verticalSpace,
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                                Icons.favorite),
                                                            8.horizontalSpace,
                                                            const Text(
                                                                '938'), // Lượt thích tạm thời
                                                            24.horizontalSpace,
                                                            Text(
                                                              timeago.format(
                                                                  (commentData[
                                                                              'time']
                                                                          as Timestamp)
                                                                      .toDate()),
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12.sp),
                                                            ),
                                                          ],
                                                        ),
                                                        29.verticalSpace,
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
          );
        });
  }
}
