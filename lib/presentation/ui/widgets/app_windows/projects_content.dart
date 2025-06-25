import 'package:flutter/material.dart';
import 'package:portifolio/presentation/ui/widgets/desktop_icon.dart';

class ProjectsContent extends StatefulWidget {
  const ProjectsContent({super.key});

  @override
  State<ProjectsContent> createState() => _ProjectsContentState();
}

class _ProjectsContentState extends State<ProjectsContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text("ALL")
            )
          ],
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
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 10,
              childAspectRatio: 0.7
            ),
            itemCount: 15, 
            itemBuilder: (context, index) {
              return DesktopIcon(
                imageUrl: "./assets/icons/program-group-icon.png", 
                height: 55, 
                title: "project $index", 
                onPressed: () {}
              );
            }
          ),
        )
      ],
    );
  }
}