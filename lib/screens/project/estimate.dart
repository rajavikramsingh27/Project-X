import 'package:flutter/material.dart';
import 'package:task_planner/theme/colors/light_colors.dart';
import 'package:task_planner/widgets/button/back_button.dart';
import 'package:task_planner/widgets/estimate/estimate_container.dart';

class ProjectEstimatePage extends StatefulWidget {
  const ProjectEstimatePage({Key key}) : super(key: key);

  @override
  State<ProjectEstimatePage> createState() => _ProjectEstimatePageState();
}

class _ProjectEstimatePageState extends State<ProjectEstimatePage> {
  List<Model> modelList;

  @override
  void initState() {
    super.initState();
    modelList = [];
    List<String> titleList = [
      "第1フェーズ", //大分類
      " DB", //小分類
      "   設計", //タスク
      "   マイグレーション作成",
      "   シーダー作成",
      " フロント",
      "   モック作成(Topページ)",
      "   モック作成(Aページ)",
      "   モック作成(Bページ)",
      "   モック作成(Cページ)",
      " 管理画面作成",
      "   モック作成",
      "第2フェーズ",
      " API作成",
      "   機能1",
      "   機能2",
      "   機能3",
    ];
    List<String> subTitleList = [
      "20人日 1,000,000円 完了予定日:2022/1/20",
      " 5人日 250,000円 完了予定日:2022/1/10",
      "   2人日 100,000円",
      "   2人日 100,000円",
      "   1人日 50,000円",
      " 5人日 250,000円 完了予定日:2022/1/12",
      "   1人日 100,000円",
      "   1人日 50,000円",
      "   1人日 50,000円",
      "   1人日 50,000円",
      " 10人日 250,000円 完了予定日:2022/1/20",
      "   10人日 500,000円",
      "10人日 500,000円",
      " 10人日 500,000円",
      "   1人日 50,000円",
      "   1人日 50,000円",
      "   1人日 50,000円",
    ];
    List<Color> boxColorList = [
      LightColors.kPalePink, //大分類
      LightColors.kLavender, //小分類
      LightColors.kLightYellow2, //タスク
      LightColors.kLightYellow2, //タスク
      LightColors.kLightYellow2, //タスク
      LightColors.kLavender,
      LightColors.kLightYellow2,
      LightColors.kLightYellow2,
      LightColors.kLightYellow2,
      LightColors.kLightYellow2,
      LightColors.kLavender,
      LightColors.kLightYellow2,
      LightColors.kPalePink,
      LightColors.kLavender,
      LightColors.kLightYellow2,
      LightColors.kLightYellow2,
      LightColors.kLightYellow2,
    ];
    for (int i = 0; i < 17; i++) {
      Model model = Model(
        title: titleList[i],
        subTitle: subTitleList[i],
        boxColor: boxColorList[i],
        key: i.toString(),
      );
      modelList.add(model);
    }
  }

  // ToDo:最後にプラス（Icons.arrow_drop_down_rounded）（これで階層、情報入力で新規作成）
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              MyBackButton(),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Create a budget',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ReorderableListView(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  onReorder: (oldIndex, newIndex) {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final Model model = modelList.removeAt(oldIndex);
                    setState(() {
                      modelList.insert(newIndex, model);
                    });
                  },
                  children: modelList.map(
                    (Model model) {
                      return Card(
                        elevation: 0,
                        color: LightColors.kLightYellow,
                        key: Key(model.key),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: EstimateContainer(
                                title: model.title,
                                subtitle: model.subTitle,
                                boxColor: model.boxColor,
                              ),
                            ),
                            SizedBox(width: 5),
                            // ToDo:ダブルタップでコピーの方がいいかも
                            Icon(Icons.add_circle_outline_rounded)
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 80,
                width: width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    GestureDetector(
                      // ToDo:タップで詳細編集
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProjectEstimatePage(),
                          ),
                        );
                      },
                      child: Container(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                        width: width - 120,
                        decoration: BoxDecoration(
                          color: LightColors.kBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
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
  }
}

class Model {
  final String title;
  final String subTitle;
  final Color boxColor;
  final String key;

  Model({
    @required this.title,
    @required this.subTitle,
    @required this.boxColor,
    @required this.key,
  });
}
