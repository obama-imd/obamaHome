import 'package:flutter/material.dart';

class PaginationResponse {
  late final List<Content> content;
  final PaginationInfo paginationInfo;

  PaginationResponse({
    required this.content,
    required this.paginationInfo,
  });

  factory PaginationResponse.fromJson(Map<String, dynamic> json) {
    return PaginationResponse(
      content: (json['content'] as List)
          .map((item) => Content.fromJson(item))
          .toList(),
      paginationInfo: PaginationInfo.fromJson(json),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content.map((item) => item.toJson()).toList(),
      ...paginationInfo.toJson(),
    };
  }
}

class Content {
  final int id;
  final String nome;
  final String? caminhoImagem;

  Content({
    required this.id,
    required this.nome,
    this.caminhoImagem,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      id: json['id'],
      nome: json['nome'],
      caminhoImagem: json['caminho_imagem'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'caminho_imagem': caminhoImagem,
    };
  }
}

class PaginationInfo {
  final Pageable pageable;
  final int totalPages;
  final int totalElements;
  final bool last;
  final int size;
  final int number;
  final List<Sort> sort;
  final int numberOfElements;
  final bool first;
  final bool empty;

  PaginationInfo({
    required this.pageable,
    required this.totalPages,
    required this.totalElements,
    required this.last,
    required this.size,
    required this.number,
    required this.sort,
    required this.numberOfElements,
    required this.first,
    required this.empty,
  });

  factory PaginationInfo.fromJson(Map<String, dynamic> json) {
    return PaginationInfo(
      pageable: Pageable.fromJson(json['pageable']),
      totalPages: json['totalPages'],
      totalElements: json['totalElements'],
      last: json['last'],
      size: json['size'],
      number: json['number'],
      sort: (json['sort'] as List)
          .map((item) => Sort.fromJson(item))
          .toList(),
      numberOfElements: json['numberOfElements'],
      first: json['first'],
      empty: json['empty'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pageable': pageable.toJson(),
      'totalPages': totalPages,
      'totalElements': totalElements,
      'last': last,
      'size': size,
      'number': number,
      'sort': sort.map((item) => item.toJson()).toList(),
      'numberOfElements': numberOfElements,
      'first': first,
      'empty': empty,
    };
  }
}

class Pageable {
  final int pageNumber;
  final int pageSize;
  final List<Sort> sort;
  final int offset;
  final bool unpaged;
  final bool paged;

  Pageable({
    required this.pageNumber,
    required this.pageSize,
    required this.sort,
    required this.offset,
    required this.unpaged,
    required this.paged,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) {
    return Pageable(
      pageNumber: json['pageNumber'],
      pageSize: json['pageSize'],
      sort: (json['sort'] as List)
          .map((item) => Sort.fromJson(item))
          .toList(),
      offset: json['offset'],
      unpaged: json['unpaged'],
      paged: json['paged'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pageNumber': pageNumber,
      'pageSize': pageSize,
      'sort': sort.map((item) => item.toJson()).toList(),
      'offset': offset,
      'unpaged': unpaged,
      'paged': paged,
    };
  }
}

class Sort {
  final String direction;
  final String property;
  final bool ignoreCase;
  final String nullHandling;
  final bool descending;
  final bool ascending;

  Sort({
    required this.direction,
    required this.property,
    required this.ignoreCase,
    required this.nullHandling,
    required this.descending,
    required this.ascending,
  });

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      direction: json['direction'],
      property: json['property'],
      ignoreCase: json['ignoreCase'],
      nullHandling: json['nullHandling'],
      descending: json['descending'],
      ascending: json['ascending'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'direction': direction,
      'property': property,
      'ignoreCase': ignoreCase,
      'nullHandling': nullHandling,
      'descending': descending,
      'ascending': ascending,
    };
  }
}
