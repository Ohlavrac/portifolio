import 'package:flutter/material.dart';
import 'package:portifolio/domain/models/enums/tags_enum.dart';
import 'package:portifolio/presentation/providers/projects_provider.dart';
import 'package:portifolio/presentation/ui/widgets/desktop_icon.dart';
import 'package:provider/provider.dart';

class ProjectsContent extends StatefulWidget {
  const ProjectsContent({super.key});

  @override
  State<ProjectsContent> createState() => _ProjectsContentState();
}

class _ProjectsContentState extends State<ProjectsContent> {
  @override
  Widget build(BuildContext context) {
    var projectsProvider = context.read<ProjectsProvider>();

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            scrollDirection: Axis.horizontal,
            itemCount: TagsEnum.values.length,
            itemBuilder: (context, index) {
              return TextButton(
                onPressed: () {}, 
                child: Text(TagsEnum.values[index].name, style: TextStyle(color: Colors.black, fontFamily: "Retro2B"),)
              );
            }
          ),
        ),
        Divider(
          color: Colors.black,
          height: 3,
          indent: 5,
          endIndent: 5,
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 8,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 10,
              mainAxisExtent: 110,
              crossAxisSpacing: 10
            ),
            itemCount: projectsProvider.projects.length, 
            itemBuilder: (context, index) {
              return DesktopIcon(
                imageUrl: "./assets/icons/program-group-icon.png", 
                height: 50,
                title: projectsProvider.projects[index].title, 
                textColor: Colors.black,
                onPressed: () {}
              );
            }
          ),
        )
      ],
    );
  }
}