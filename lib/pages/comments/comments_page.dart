import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/models/model_user.dart';
import 'package:movie_app/provider/comment_provider.dart';
import 'package:movie_app/provider/setting_app_provider.dart';
import 'package:movie_app/widgets/input_name_custom.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key, required this.idMovie});

  final int idMovie;

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  TextEditingController commentController = TextEditingController();
  late final Stream<QuerySnapshot> commentStream;

  @override
  void initState() {
    commentStream = FirebaseFirestore.instance
        .collection('comment')
        .doc(widget.idMovie.toString())
        .collection('userComment')
        .orderBy('time', descending: true)
        .snapshots();
    super.initState();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CommentProvider(),
        builder: (context, _) {
          return Scaffold(
            body: StreamBuilder<QuerySnapshot>(
                stream: commentStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }
                  List data = snapshot.data!.docs;

                  return SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back),
                              ),
                              Text(
                                '${data.length} Comments',
                                style: SettingApp.heding1
                                    .copyWith(fontSize: 24.sp),
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/images/detail/MoreCircle.png',
                                color: const Color(0xffFFFFFF),
                              ),
                            ],
                          ),
                        ),
                        24.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                // Lấy thông tin người dùng cho từng comment
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FutureBuilder(
                                      future: FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(data[index]['userId'])
                                          .get(),
                                      builder: (context, userSnapshot) {
                                        if (userSnapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const SizedBox();
                                        }
                                        if (userSnapshot.hasError ||
                                            !userSnapshot.hasData) {
                                          return const Text("User not found");
                                        }

                                        Map<String, dynamic> userData =
                                            userSnapshot.data!.data()!;
                                        ModelUser user =
                                            ModelUser.fromMap(userData);

                                        return Row(
                                          children: [
                                            Image.network(
                                              user.image,
                                              width: 48.w,
                                              height: 48.h,
                                            ),
                                            16.horizontalSpace,
                                            Expanded(
                                              child: Text(
                                                user.fullName,
                                                style: SettingApp.heding1
                                                    .copyWith(fontSize: 16.sp),
                                              ),
                                            ),
                                            Image.asset(
                                              'assets/images/detail/MoreCircle.png',
                                              color: const Color(0xffFFFFFF),
                                              width: 24.w,
                                              height: 24.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    12.verticalSpace,
                                    Text(
                                      data[index]['message'] ??
                                          'No message available',
                                      style: SettingApp.heding4,
                                    ),
                                    12.verticalSpace,
                                    Row(
                                      children: [
                                        const Icon(Icons.favorite),
                                        8.horizontalSpace,
                                        const Text('938'),
                                        24.horizontalSpace,
                                        // Hiển thị thời gian bằng timeago
                                        Text(
                                          timeago.format(
                                              (data[index]['time'] as Timestamp)
                                                  .toDate()),
                                          style: TextStyle(fontSize: 12.sp),
                                        ),
                                      ],
                                    ),
                                    29.verticalSpace,
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 24.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24.r),
                                topRight: Radius.circular(24.r)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xff1F222A),
                                blurRadius: 24,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: InputNameCustom(
                                  controller: commentController,
                                  hintText: 'Add comment...',
                                  prefixIcon: const Icon(Icons.tag_faces),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Container(
                                padding: EdgeInsets.all(18.w),
                                decoration: const BoxDecoration(
                                  color: Color(0xffE21221),
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    context.read<CommentProvider>().comment(
                                          context
                                              .read<SettingAppProvider>()
                                              .uId,
                                          commentController.text,
                                          widget.idMovie,
                                        );
                                    commentController.clear();
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: const Icon(
                                    Icons.send,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          );
        });
  }
}
