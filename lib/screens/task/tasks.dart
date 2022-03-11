
import 'package:flutter/material.dart';
import 'package:task_planner/theme/colors/light_colors.dart';
import 'package:task_planner/widgets/button/back_button.dart';
import 'package:task_planner/widgets/task/task_container.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<Model> modelList;

  @override
  void initState() {
    super.initState();
    modelList = [];
    List<String> titleList = [
      "Vueの質問（向江さん）",
      "DB仕様書作成",
      "管理画面開発",
      "ProjectXの設計",
      "シーダー作成",
      "シーダー動作確認",
      "Git連携",
      "OCR",
      "Vue.js",
    ];
    List<String> subTitleList = [
      "Moneyboard(打ち合わせ) 工数:1",
      "Moneyboard(ドキュメント作成) 工数:1",
      "Moneyboard(モック作成) 工数:1",
      "ProjectX(機能設計) 工数:1",
      "Moneyboard(開発) 工数:1",
      "Moneyboard(テスト) 工数:1",
      "ProjectX(環境構築) 工数:1",
      "Moneyboard(調査) 工数:1",
      "Moneyboard(学習) 工数:1",
    ];
    List<Color> boxColorList = [
      LightColors.kLightYellow2,
      LightColors.kLightYellow2,
      LightColors.kLightYellow2,
      LightColors.kLightYellow2,
      LightColors.kLightYellow2,
      LightColors.kLightYellow2,
      LightColors.kLightYellow2,
      LightColors.kLightYellow2,
      LightColors.kLightYellow2,
    ];
    for (int i = 0; i < 9; i++) {
      Model model = Model(
        title: titleList[i],
        subTitle: subTitleList[i],
        boxColor: boxColorList[i],
        key: i.toString(),
      );
      modelList.add(model);
    }
  }

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
                    'Tasks',
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
                              child: TaskContainer(
                                title: model.title,
                                subtitle: model.subTitle,
                                boxColor: model.boxColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
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
