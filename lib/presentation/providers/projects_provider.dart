import 'package:flutter/material.dart';
import 'package:portifolio/domain/models/enums/tags_enum.dart';
import 'package:portifolio/domain/models/project_model.dart';

class ProjectsProvider extends ChangeNotifier {

  List<ProjectModel> projects = [
    ProjectModel(
      id: 1, 
      title: "Meu Dinheirinho", 
      description: "Aplicativo mobile para controle de gastor, desenvolvi o mesmo com o intuito de controlar meus proprios gastos, alem de usar o projeto para praticar conceitos como armazenamento local em flutter usando a biblioteca drift", 
      tags: [TagsEnum.mobile, TagsEnum.flutter, TagsEnum.frontend], 
      repositoryLink: "https://github.com/Ohlavrac/meu_dinheirinho", 
      deployLink: ""
    ),

    ProjectModel(
      id: 2, 
      title: "Inventory Manager", 
      description: """
        RestAPI para gerenciamento de inventario de um galpao ou empresa. O projeto foi desenvolvido usando Spring Boot junto de um banco de dados PostgreSQL, 
        o objetivo do projeto foi o estudo de desenvolvimento de RestAPIs usando Spring Boot, alem de estudar implentação de authentication e testes unitarios
        """, 
      tags: [TagsEnum.backend, TagsEnum.java, TagsEnum.springboot], 
      repositoryLink: "https://github.com/Ohlavrac/inventory-manager", 
      deployLink: ""
    ),
  ];

}