model Cost {
  @doc("仕入本体価格")
  cost_price: uint32;

  @doc("リサイクル預託金")
  recycling_fee: uint32;

  @doc("自動車税")
  automotive_tax: uint32;

  @doc("自動車重量税")
  automobile_weight_tax: uint32;

  @doc("自動車賠償責任保険料")
  automobile_liability_insurance: uint32;
}

model UpdateCostPayload {
  @doc("仕入本体価格")
  cost_price?: uint32;

  @doc("リサイクル預託金")
  recycling_fee?: uint32;

  @doc("自動車税")
  automotive_tax?: uint32;

  @doc("自動車重量税")
  automobile_weight_tax?: uint32;

  @doc("自動車賠償責任保険料")
  automobile_liability_insurance?: uint32;
}
