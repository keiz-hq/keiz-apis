model Metadata {
  @doc("登録日時")
  registered_at: utcDateTime;

  @doc("最終更新日時")
  last_modified_at: utcDateTime;

  @doc("売却日時 (販売中の場合はNULL)")
  sold_at?: utcDateTime;
}
