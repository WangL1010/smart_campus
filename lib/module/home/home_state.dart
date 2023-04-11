import 'package:smart_campus/app/config/images/image_common.dart';
import 'package:smart_campus/data/bean/home/news_detail_bean.dart';

class HomeState {
  HomeState() {
    ///Initialize variables
  }
}
List<NewsDetailBean> newsList = [
  NewsDetailBean(
      newsId: 1,
      itemImageUrl: ImageCommon.loop_image_1,
      itemTitle: "校园美景赏析",
      newsTime: "2022-03-23 10:23",
      content: "春天来了，校园里的美景也愈加美丽。学生们可以去操场上玩耍，还可以去河边散步。"
  ),
  NewsDetailBean(
      newsId: 2,
      itemImageUrl: ImageCommon.loop_image_2,
      itemTitle: "校园文化活动",
      newsTime: "2022-03-22 15:34",
      content: "近日，我校举行了一场诗歌朗诵比赛，吸引了众多学生前来观看。本次比赛的主题是“春天的美好”，参赛选手们通过诗歌朗诵表达对春天的热爱之情。"
  ),
  NewsDetailBean(
      newsId: 3,
      itemImageUrl: ImageCommon.loop_image_3,
      itemTitle: "校园招聘会",
      newsTime: "2022-03-21 09:45",
      content: "为了帮助即将毕业的学生找到合适的工作，我校举行了一场招聘会。多家知名企业参与了本次招聘会，提供了大量的实习和就业机会。"
  ),
  NewsDetailBean(
      newsId: 4,
      itemImageUrl: ImageCommon.loop_image_4,
      itemTitle: "校园足球赛",
      newsTime: "2022-03-20 13:20",
      content: "近日，我校足球队与附近的一所高校足球队进行了友谊赛。双方你来我往，比赛非常激烈。最终，我校足球队以2:1的比分取得了胜利。"
  ),
];
