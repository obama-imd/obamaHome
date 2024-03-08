Future<(List<Map<String, dynamic>>, Object?, Object?, Object?, Object?)>
    fetchData(String searchTerm) async {
  // final response = await http.get(Uri.parse('http://localhost:3000/dados'));

  final response = {
    "content": [
      {
        "id": 560,
        "nome": "1 line",
        "url":
            "https://play-lh.googleusercontent.com/psdUmoQI_eEDicPiGO3yYbwOZoCICXmkDmr0nZNZPF0JmAYq0_k-gXXXywfrFD_jatw=w240-h480-rw"
      },
      {
        "id": 393,
        "nome": "1001 Tangram puzzles game",
        "url":
            "https://play-lh.googleusercontent.com/NFSxlGDID5TSJTSuaiDyVf7P1UvJ5HHhw7urxdf0d6yT70SSYnCZziexFCcjXOBtRhw=w240-h480-rw"
      },
      {
        "id": 394,
        "nome": "1010!",
        "url":
            "https://play-lh.googleusercontent.com/_KpeBUm3VDetbR0uYVpXrYhosah-xs0uTIFB2mazxgV-5u19aLfROtmOhOvH2QbudcY=w526-h296-rw"
      },
      {"id": 439, "nome": "19 Numbers", "url": ""},
      {
        "id": 525,
        "nome": "2048",
        "url":
            "data:image/png;base64,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"
      },
      {
        "id": 261,
        "nome": "2048",
        "url":
            "data:image/png;base64,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"
      },
      {
        "id": 555,
        "nome": "2248",
        "url":
            "https://play-lh.googleusercontent.com/PLfEEZi5IA0QNn40mXn14CRxndaiHtnLS-snGv4Ik-4GlMI_ZtlpBgkB90QRTI7Yxaw=w2560-h1440-rw"
      },
      {
        "id": 441,
        "nome": "2Fuse",
        "url":
            "https://images.sftcdn.net/images/t_app-cover-l,f_auto/p/331d881c-9775-11e6-b539-3b92631fc6b0/622833080/2fuse-screenshot.png"
      },
      {"id": 603, "nome": "3D Gr??ficos", "url": ""},
      {
        "id": 442,
        "nome": "3D Minesweeper - Dig Mines 3D",
        "url":
            "https://play-lh.googleusercontent.com/jL5Z9VV7b9hKgE9Y3HZmqFuDfMo1BObYG2QRDJDRy6Fdn91AolJPBjVGjxM929K8qoTj=w240-h480-rw"
      },
    ],
    "pageable": {
      "pageNumber": 0,
      "pageSize": 10,
      "sort": [
        {
          "direction": "ASC",
          "property": "nome",
          "ignoreCase": false,
          "nullHandling": "NATIVE",
          "ascending": true,
          "descending": false
        }
      ],
      "offset": 0,
      "paged": true,
      "unpaged": false
    },
    "totalPages": 25,
    "totalElements": 249,
    "last": false,
    "size": 10,
    "number": 0,
    "sort": [
      {
        "direction": "ASC",
        "property": "nome",
        "ignoreCase": false,
        "nullHandling": "NATIVE",
        "ascending": true,
        "descending": false
      }
    ],
    "numberOfElements": 10,
    "first": true,
    "empty": false
  };

  // if (response.statusCode == 200) {
  // final jsonData = jsonDecode(response.body);
  final totalPages = response['totalPages'];
  final totalElements = response['totalElements'];
  final currentPage = response['number'];
  final itemsPerPage = response['numberOfElements'];
  List<dynamic> jsonData = response['content'] as List<dynamic>;

  final postsFiltrados = filtrarOA(jsonData, searchTerm);
  if (postsFiltrados.isNotEmpty) {
    final posts = postsFiltrados
        .map((item) => {
              'id': item['id'],
              'nome': item['nome'],
              'url': item['url'],
            })
        .toList()
        .reversed
        .toList();
    return (posts, totalPages, totalElements, currentPage, itemsPerPage);
  } else {
    List<Map<String, dynamic>> listaVazia = [];
    return (listaVazia, totalPages, totalElements, currentPage, itemsPerPage);
  }
}

List<dynamic> filtrarOA(List<dynamic> jsonData, String searchTerm) {
  if (searchTerm.isEmpty) {
    return jsonData;
  }

  List<dynamic> comparingData = jsonData.where((item) {
    final id = item['id'].toString().toLowerCase();
    final nome = item['nome'].toString().toLowerCase();

    return nome.contains(searchTerm.toLowerCase()) ||
        id.contains(searchTerm.toLowerCase());
  }).toList();

  if (comparingData.isEmpty) {
    return <dynamic>[];
  } else {
    return comparingData;
  }
}
