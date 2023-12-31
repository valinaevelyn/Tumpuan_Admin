library dashboard;

import 'package:daily_task/app/constans/app_constants.dart';
import 'package:daily_task/app/shared_components/card_task.dart';
import 'package:daily_task/app/shared_components/header_text.dart';
import 'package:daily_task/app/shared_components/list_task_assigned.dart';
import 'package:daily_task/app/shared_components/list_task_date.dart';
import 'package:daily_task/app/shared_components/responsive_builder.dart';
import 'package:daily_task/app/shared_components/search_field.dart';
import 'package:daily_task/app/shared_components/selection_button.dart';
import 'package:daily_task/app/shared_components/simple_selection_button.dart';
import 'package:daily_task/app/shared_components/simple_user_profile.dart';
import 'package:daily_task/app/shared_components/task_progress.dart';
import 'package:daily_task/app/shared_components/user_profile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daily_task/app/utils/helpers/app_helpers.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

// binding
part '../../bindings/dashboard_binding.dart';

// controller
part '../../controllers/dashboard_controller.dart';

// model

// component
part '../components/bottom_navbar.dart';
part '../components/header_weekly_task.dart';
part '../components/main_menu.dart';
part '../components/task_menu.dart';
part '../components/member.dart';
part '../components/task_in_progress.dart';
part '../components/weekly_task.dart';
part '../components/task_group.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scafoldKey,
      drawer: ResponsiveBuilder.isDesktop(context)
          ? null
          : Drawer(
              child: SafeArea(
                child: SingleChildScrollView(child: _buildSidebar(context)),
              ),
            ),
      bottomNavigationBar: (ResponsiveBuilder.isDesktop(context) || kIsWeb)
          ? null
          : const _BottomNavbar(),
      body: SafeArea(
        child: ResponsiveBuilder(
          mobileBuilder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTaskContent(
                    onPressedMenu: () => controller.openDrawer(),
                  ),
                  _buildCalendarContent(),
                ],
              ),
            );
          },
          tabletBuilder: (context, constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: constraints.maxWidth > 800 ? 8 : 7,
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: _buildTaskContent(
                      onPressedMenu: () => controller.openDrawer(),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const VerticalDivider(),
                ),
                Flexible(
                  flex: 4,
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: _buildCalendarContent(),
                  ),
                ),
              ],
            );
          },
          desktopBuilder: (context, constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: constraints.maxWidth > 1350 ? 3 : 4,
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: _buildSidebar(context),
                  ),
                ),
                Flexible(
                  flex: constraints.maxWidth > 1350 ? 10 : 9,
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: _buildTaskContent(),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const VerticalDivider(),
                ),
                Flexible(
                  flex: 4,
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: _buildCalendarContent(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: UserProfile(
            data: controller.dataProfil,
            onPressed: controller.onPressedProfil,
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _MainMenu(onSelected: controller.onSelectedMainMenu),
        ),
        const SizedBox(height: 0),
        Center(
          child: Container(
            width: 250,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kFontColorPallets[0],
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(15),
            child: Text(
              "Copyright @ Mules 2023",
              style: TextStyle(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTaskContent({Function()? onPressedMenu}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        children: [
          const SizedBox(height: kSpacing),
          Row(
            children: [
              if (onPressedMenu != null)
                Padding(
                  padding: const EdgeInsets.only(right: kSpacing / 2),
                  child: IconButton(
                    onPressed: onPressedMenu,
                    icon: const Icon(Icons.menu),
                    color: kFontColorPallets[0],
                  ),
                ),
              Expanded(
                child: SearchField(
                  onSearch: controller.searchTask,
                  hintText: "Search ",
                ),
              ),
            ],
          ),
          const SizedBox(height: kSpacing),
          Row(
            children: [
              Expanded(
                child: HeaderText(
                  DateTime.now().formatdMMMMY(),
                ),
              ),
              const SizedBox(width: kSpacing / 2),
            ],
          ),
          const SizedBox(height: kSpacing),
          _TaskInProgress(data: controller.taskInProgress),
          const SizedBox(height: kSpacing * 2),
          const _HeaderWeeklyTask(),
          const SizedBox(height: kSpacing),
          // _WeeklyTask(
          //   data: controller.weeklyTask,
          //   onPressed: controller.onPressedTask,
          //   onPressedAssign: controller.onPressedAssignTask,
          //   onPressedMember: controller.onPressedMemberTask,
          // )

          ClipRRect(
            borderRadius: BorderRadius.circular(kBorderRadius),
            child: Container(
              height: 300,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: kSpacing / 2),
              decoration: BoxDecoration(
                // color: kFontColorPallets[2],
                border: Border.all(
                  color: kFontColorPallets[0],
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Text('User Daily',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: kFontColorPallets[0],
                          letterSpacing: 1,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
          const SizedBox(height: kSpacing),

          Row(
            children: [
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  color: kFontColorPallets[2],
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text('Review Daily Quiz',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: kFontColorPallets[0],
                      letterSpacing: 1,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center),
              ),
              const Spacer(),
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  color: kFontColorPallets[2],
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text('Review Suara Puan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: kFontColorPallets[0],
                      letterSpacing: 1,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center),
              ),
            ],
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }

  Widget _buildCalendarContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        children: [
          const SizedBox(height: kSpacing),
          Row(
            children: [
              const Expanded(child: HeaderText("Log")),
              GestureDetector(
                onTap: () {},
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Show More',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: kFontColorPallets[2],
                      ),
                    )),
              )
            ],
          ),
          const SizedBox(height: kSpacing),
          ...controller.taskGroup
              .map(
                (e) => _TaskGroup(
                  title: DateFormat('d MMMM').format(e[0].date),
                  data: e,
                  onPressed: controller.onPressedTaskGroup,
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
