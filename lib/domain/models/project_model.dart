import 'package:portifolio/domain/models/enums/tags_enum.dart';

class ProjectModel {
  final int id;
  final String title;
  final String description;
  final List<TagsEnum> tags;
  final String repositoryLink;
  final String deployLink;

  ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.tags,
    required this.repositoryLink,
    required this.deployLink
  });
}