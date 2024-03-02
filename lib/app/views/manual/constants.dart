class manualItem {
  final String accordionTitle;
  final String paragraph;
  final String subtitle;
  final List<String> topics;
  final String idVideo;

  manualItem(
      {required this.accordionTitle,
      required this.paragraph,
      required this.subtitle,
      required this.topics,
      required this.idVideo});
}

final List<manualItem> manualItems = [
  manualItem(
      accordionTitle: 'Cadastro e Login',
      paragraph:
          'O cadastro na plataforma é rápido, fácil e totalmente gratuito.',
      subtitle: 'Para isso, você tem três opções:',
      topics: [
        'Você pode utilizar o seu Facebook. Basta clicar, autenticar e pronto! Está cadastrado e logado! Falei que era rápido!?,'
            'Você pode utilizar, também, o seu Gmail. Basta clicar, autenticar e pronto! Cadastro e login na Plataforma OBAMA realizados com sucesso!',
        'A terceira opção é um cadastro manual, onde você deve colocar o seu nome, e-mail e uma senha, depois é só confirmar o e-mail cadastrado. Simples né?'
      ],
      idVideo: "Anx0xQ4dqmA"),
  manualItem(
      accordionTitle: 'Busca textual',
      paragraph:
          'Nessa parte, você pode fazer uma busca textual rápida, colocando alguns termos que estejam relacionados a conteúdos da matemática (você pode usar termos que aparecem nos descritores dos PCN e BNCC!)',
      subtitle: '',
      topics: [''],
      idVideo: '7RJ7VUaIyEU'),
  manualItem(
      accordionTitle: 'Busca avançada',
      paragraph:
          'Para pesquisar com mais precisão (e sabedoria), você pode utilizar a busca avançada da plataforma, que te permite achar objetos por:',
      subtitle: '',
      topics: [
        'Tema curricular;',
        'Descritores (utilizados os descritores do Sistema de Avaliação da Educação Básica -Saeb);',
        'Nível de ensino;',
        'Tipo de visualização (Celular/Tablet, Online ou Download).'
      ],
      idVideo: '9PsXHtWS-8k'),
  manualItem(
      accordionTitle: 'Criação de plano de aula',
      paragraph:
          'Que tal conhecer nossa ferramenta para escrita de plano de aula? E ainda dá para compartilhar com seus colegas e produzirem de forma colaborativa?',
      subtitle:
          'A escrita do plano de aula é dividida em três passos, vamos conhecer cada um desses passos?',
      topics: [
        'No primeiro passo você deve informar o nome da instituição a que se destina esse plano de aula, uma frase curta que defina sua aula (esse será o título da aula), a que ano de ensino sua proposta de aula melhor se aplica e quanto tempo (em minutos) você acha necessário para a aplicação deste plano de aula.',
        'O segundo passo é a descrição do seu plano de aula, onde você deve escrever seu objetivo geral, objetivos específicos, metodologia, avaliação, recursos necessários e referências.',
        'No terceiro e último passo você pode buscar e adicionar (ou não) um ou mais OA para complementar seu plano de aula e então enviar para revisão onde iremos validar seu plano, por isso, capricha!'
      ],
      idVideo: 'NFyNoyrA7CY'),
];
