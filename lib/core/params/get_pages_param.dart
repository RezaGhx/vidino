class GetPagesParam {
  final String? page;
  final String? pageSize;
  final String? category;

  GetPagesParam({
    this.page,
    this.pageSize,
    this.category,
  });

  GetPagesParam copyWith({
    String? page,
    String? pageSize,
    String? category,
  }) =>
      GetPagesParam(
        page: page ?? this.page,
        pageSize: pageSize ?? this.pageSize,
        category: category ?? this.category,
      );

}