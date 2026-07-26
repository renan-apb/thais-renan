// Editable wedding copy and URLs — update here without touching UI widgets.

class WeddingNavItem {
  const WeddingNavItem({required this.label, required this.sectionKey});

  final String label;
  final String sectionKey;
}

class InfoLine {
  const InfoLine({
    required this.label,
    required this.value,
    this.linkUrl,
  });

  final String label;
  final String value;

  /// When set, [value] is shown as link text and this URL is opened on tap.
  /// If null and [value] starts with `http://` or `https://`, [value] is used as the URL.
  final String? linkUrl;
}

class InfoBlock {
  const InfoBlock({required this.title, required this.lines});

  final String title;
  final List<InfoLine> lines;
}

class WeddingSectionCopy {
  const WeddingSectionCopy({required this.title, required this.body});

  final String title;
  final String body;
}

abstract final class WeddingContent {
  static const appTitle = 'Thaís & Renan';

  static const eyebrow = 'Nosso casamento';
  static const brideName = 'Thaís';
  static const groomName = 'Renan';
  static const heroSubtitle =
      'Com muito amor e alegria, criamos este espaço para compartilhar com vocês '
      'os detalhes de um dos dias mais especiais das nossas vidas.';

  static const eventDateLabel = '10 de julho de 2027';
  static const eventLocationLabel = 'Nova Veneza - SC';

  static const whatsappUrl = 'https://wa.me/5548999405772';
  static const mapsUrl = 'https://maps.google.com';

  static const navItems = [
    WeddingNavItem(label: 'Nossa história', sectionKey: 'historia'),
    WeddingNavItem(label: 'Detalhes', sectionKey: 'detalhes'),
    WeddingNavItem(label: 'Confirmação', sectionKey: 'presenca'),
    WeddingNavItem(label: 'Presentes', sectionKey: 'presentes'),
  ];

  static const historyQuote =
      '“Estamos muito felizes em celebrar este momento ao lado das pessoas que fazem parte da nossa história.”';
  static const historyNote =
      'Em breve, podemos adicionar aqui fotos e um texto contando mais sobre vocês.';

  static const welcome = WeddingSectionCopy(
    title: 'Bem-vindos',
    body:
        'Criamos este site para reunir as principais informações do nosso casamento de forma simples, '
        'bonita e prática. Aqui vocês poderão acompanhar os detalhes da cerimônia, recepção, '
        'confirmação de presença e, em breve, nossa lista de presentes.',
  );

  static const details = WeddingSectionCopy(
    title: 'Detalhes do grande dia',
    body:
        'Guardem esta data com carinho. Quando tivermos todos os detalhes finais da cerimônia, '
        'atualizaremos esta página.',
  );

  static const ceremony = InfoBlock(
    title: 'Cerimônia',
    lines: [
      InfoLine(label: 'Data', value: '10/07/2027, às 16:30'),
      InfoLine(label: 'Cidade', value: 'Nova Veneza - SC'),
      InfoLine(
          label: 'Local',
          value: 'Santuário da Diocesano Nossa Senhora do Caravaggio'),
      InfoLine(
        label: 'Endereço',
        value: 'Abrir no Google Maps',
        linkUrl: 'https://maps.app.goo.gl/1Jogb5iheGxt6LL46',
      ),
    ],
  );

  static const reception = InfoBlock(
    title: 'Recepção',
    lines: [
      InfoLine(label: 'Local', value: 'Casa de eventos La Brace'),
      InfoLine(label: 'Cidade', value: 'Nova Veneza - SC'),
      InfoLine(
        label: 'Endereço',
        value: 'Abrir no Google Maps',
        linkUrl: 'https://maps.app.goo.gl/ZgSfDKRYYy49sKJK8',
      ),
    ],
  );

  static const rsvp = WeddingSectionCopy(
    title: 'Confirmação de presença',
    body:
        'Para facilitar, a confirmação inicial pode ser feita diretamente pelo WhatsApp. '
        'Depois, se vocês quiserem, podemos trocar isso por um formulário mais organizado.',
  );

  static const gifts = WeddingSectionCopy(
    title: 'Lista de presentes',
    body:
        'Nossa lista ainda será criada. Quando estiver pronta, adicionaremos aqui os links para facilitar o acesso.',
  );
  static const giftsPlaceholder =
      'Em breve: links da lista de presentes e outras opções que vocês desejarem incluir.';

  static const directions = WeddingSectionCopy(
    title: 'Como chegar',
    body:
        'Quando o endereço final estiver confirmado, também podemos colocar aqui um botão com o mapa exato, '
        'além de sugestões de hospedagem e estacionamento, se fizer sentido.',
  );

  static const footerText =
      'Feito com carinho para compartilhar esse momento especial ✨';

  static const confirmPresenceLabel = 'Confirmar presença';
  static const viewDetailsLabel = 'Ver informações';
  static const confirmWhatsAppLabel = 'Confirmar pelo WhatsApp';
  static const openMapLabel = 'Abrir no mapa';
}
