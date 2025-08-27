model Website {
  @doc("備考")
  note: string;

  @doc("ラインナップ表示順序（1からスタート、0はラインナップに表示しない）")
  lineup_order: uint32;

  @doc("おすすめ表示順序（1からスタート、0はおすすめに表示しない）")
  recommendation_order: uint32;
}
