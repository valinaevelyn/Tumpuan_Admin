part of dashboard;

class _MainMenu extends StatelessWidget {
  const _MainMenu({
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  final Function(int index, SelectionButtonData value) onSelected;

  @override
  Widget build(BuildContext context) {
    return SelectionButton(
      data: [
        SelectionButtonData(
          activeIcon: EvaIcons.home,
          icon: EvaIcons.homeOutline,
          label: "Dashboard",
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.people,
          icon: EvaIcons.peopleOutline,
          label: "Manage Role",
          // totalNotif: 100,
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.volumeUp,
          icon: EvaIcons.volumeUpOutline,
          label: "Suara Puan",
          // totalNotif: 20,
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.volumeUp,
          icon: EvaIcons.volumeUpOutline,
          label: "Kategori Suara Puan",
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.calendar,
          icon: EvaIcons.calendarOutline,
          label: "Daily Quiz",
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.fileText,
          icon: EvaIcons.fileTextOutline,
          label: "Untuk Puan",
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.fileText,
          icon: EvaIcons.fileTextOutline,
          label: "Kategori Untuk Puan",
        ),
      ],
      onSelected: onSelected,
    );
  }
}
