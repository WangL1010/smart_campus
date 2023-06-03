import '../../../data/bean/common/filter_info.dart';
import '../../../data/bean/home/competition_bean.dart';

class GameInfoState {
  late List<FilterInfo> filterType;
  FilterInfo? curType;
  late List<FilterInfo> filterJoin;
  FilterInfo? curJoin;
  late List<CompetitionBean> shows;

  GameInfoState() {
    shows = [];
    filterType = [
      FilterInfo(name: '全部', tag: '0'),
      FilterInfo(name: '外国语', tag: '1'),
      FilterInfo(name: '物理科学与技术', tag: '2'),
      FilterInfo(name: '数学与统计', tag: '3'),
      FilterInfo(name: '化学与材料科学', tag: '4'),
      FilterInfo(name: '计算机科学与技术', tag: '5'),
    ];
    filterJoin = [
      FilterInfo(name: '全部', tag: '0'),
      FilterInfo(name: '校级赛事', tag: '1'),
      FilterInfo(name: '院级赛事', tag: '2'),
    ];
  }
}

List<CompetitionBean> competitionList = [
  CompetitionBean(
    competitionId: 1,
    competitionName: "英语竞赛",
    publishTime: "2022-08-01 09:00:00",
    location: "学术报告厅",
    eventTime: "2022-09-15 14:00:00",
    eventContent: "针对大学生的英语口语和写作竞赛",
    registrationDeadline: "2022-09-05 23:59:59",
    eventLevel: "校级赛事",
    relatedCollege: "外国语学院",
    eventLevelType: 1,
    collegeType: 1,
  ),
  CompetitionBean(
    competitionId: 2,
    competitionName: "物理竞赛",
    publishTime: "2022-07-20 13:00:00",
    location: "实验楼",
    eventTime: "2022-09-30 09:00:00",
    eventContent: "面向物理专业学生的理论和实验竞赛",
    registrationDeadline: "2022-09-20 23:59:59",
    eventLevel: "院级赛事",
    relatedCollege: "物理科学与技术学院",
    eventLevelType: 2,
    collegeType: 2,
  ),
  CompetitionBean(
    competitionId: 3,
    competitionName: "数学建模竞赛",
    publishTime: "2022-09-10 10:30:00",
    location: "教学楼",
    eventTime: "2022-10-20 08:00:00",
    eventContent: "要求参赛者通过数学建模解决实际问题",
    registrationDeadline: "2022-10-10 23:59:59",
    eventLevel: "校际赛事",
    relatedCollege: "数学与统计学院",
    eventLevelType: 1,
    collegeType: 3,
  ),
  CompetitionBean(
    competitionId: 4,
    competitionName: "化学竞赛",
    publishTime: "2022-08-25 15:45:00",
    location: "化学实验室",
    eventTime: "2022-11-05 13:00:00",
    eventContent: "面向化学专业学生的理论和实验竞赛",
    registrationDeadline: "2022-10-30 23:59:59",
    eventLevel: "院级赛事",
    relatedCollege: "化学与材料科学学院",
    eventLevelType: 2,
    collegeType: 4,
  ),
  CompetitionBean(
    competitionId: 5,
    competitionName: "计算机编程竞赛",
    publishTime: "2022-09-05 11:20:00",
    location: "计算机实验室",
    eventTime: "2022-11-15 09:00:00",
    eventContent: "测试",
    registrationDeadline: "2022-11-10 23:59:59",
    eventLevel: "校际赛事",
    relatedCollege: "计算机科学与技术学院",
    eventLevelType: 1,
    collegeType: 5,
  ),
];
