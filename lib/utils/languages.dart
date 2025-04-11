Map<String, dynamic> eng = {
  "titles": {
    "informations_title": "Informations",
    "send_email_title": "Send Email",
    "social_title": "Social Medias",
    "my_network_title": "My Network",
    "spotify_title": "Spotify",
    "warning_title": "Warning",
    "sending_email": "Sending Email . . ."
  },
  "texts": {
    "name": "Name",
    "software_engineer": "Software Enginner",
    "education": "Education",
    "graduation_type": "B.S",
    "graduation": "Computer Science",
    "college": "Universidade Estadual\ndo Piaui - UESPI",
    "college_period": "Sep 2019 - Dec 2024",
    "about_me": "About Me",
    "about_me_text": "Hi, my name is João Victor, I'm 23 years old and I'm a full-stack developer with a degree in Computer Science. I've always been fascinated by the world of technology, always trying to understand how the games I played worked, which was my main motivation to start programming. I currently work as a full-stack developer and I'm always looking for a new challenge or task to put my skills into practice and to learn something new.",
    "programming_langs": "Programming Languages",
    "programming_langs_content": "Dart | Java | Javascript | Python | C | Lua | Typescript",
    "tecnologies": "Tecnologies",
    "tecnologies_content": "Flutter | Spring Boot | Express | Firebase | Prisma | MySQL | MongoDB | PostgreSQL",
    "languages": "Languages",
    "languages_content": "Portuguese (Fluent) | English (Advanced Intermediate)",
    "your_email": "Your Email",
    "your_message": "Your Message"
  },
};

Map<String, dynamic> ptbr = {
  "titles": {
    "informations_title": "Informações",
    "send_email_title": "Enviar Email",
    "social_title": "Redes Sociais",
    "my_network_title": "Minha Rede",
    "spotify_title": "Spotify",
    "warning_title": "Atenção",
    "sending_email": "Enviando Email . . ."
  },
  "texts": {
    "name": "Nome",
    "software_engineer": "Engenheiro de\nSoftware",
    "education": "Educação",
    "graduation_type": "Bacharel",
    "graduation": "Ciência da Computação",
    "college": "Universidade Estadual\ndo Piaui - UESPI",
    "college_period": "Set 2019 - Dez 2024",
    "about_me": "Sobre Mim",
    "about_me_text": "Olá, meu nome é João Victor, tenho 23 anos e sou desenvolvedor full-stack formado em Ciência da Computação. Sempre fui fascinado pelo mundo da tecnologia, sempre buscando entender como os jogos que eu jogava funcionavam, o que foi minha principal motivação para começar a programar. Atualmente trabalho como desenvolvedor full-stack e estou sempre em busca de um novo desafio ou tarefa para colocar minhas habilidades em prática e aprender algo novo.",
    "programming_langs": "Linguagens",
    "programming_langs_content": "Dart | Java | Javascript | Python | C | Lua | Typescript",
    "tecnologies": "Tecnologias",
    "tecnologies_content": "Flutter | Spring Boot | Express | Firebase | Prisma | MySQL | MongoDB | PostgreSQL",
    "languages": "Idiomas",
    "languages_content": "Portugues (Fluente) | Ingles (Intermediario)",
    "your_email": "Seu Email",
    "your_message": "Sua Mensagem"
  }
};

String getTextValueByLanguageKey(String lang, String key) {
  if (lang == "ENG") {
    return eng["texts"][key];
  } else {
    return ptbr["texts"][key];
  }
}

String getTitleValueByLanguageKey(String lang, String key) {
  if (lang == "ENG") {
    return eng["titles"][key];
  } else {
    return ptbr["titles"][key];
  }
}