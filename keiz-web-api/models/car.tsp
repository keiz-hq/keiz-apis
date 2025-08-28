model Car {
  id: uuid;

  @doc("メーカー")
  manufacturer: Choice;

  @doc("車種名")
  brand_name: string;

  @doc("グレード名")
  grade_name: string;

  @doc("ボディタイプ")
  body_type: Choice;

  @doc("ボディカラー")
  color: Choice;

  @doc("乗車定員")
  passengers: uint32;

  @doc("ドア数")
  doors: uint32;

  @doc("ハンドル位置")
  handle_position: Choice;

  @doc("排気量 (cc)")
  displacement: uint32;

  @doc("駆動方式")
  driving_wheels_type: Choice;

  @doc("トランスミッション")
  transmission_type: Choice;

  @doc("燃料")
  fuel_type: Choice;

  @doc("装備")
  accessories: Choice[];

  @doc("走行距離 (km)")
  mileage: uint32;

  @doc("修復歴")
  repair_history: RepairHistory;

  @doc("車歴")
  car_history: Choice;

  @doc("登録情報")
  registration: Registration;

  @doc("コスト")
  cost: Cost;

  @doc("価格")
  prices: Price[];

  @doc("画像")
  images: Image[];

  @doc("アフターサービス")
  after_service: AfterService;

  @doc("Webサイト情報")
  website: Website;

  @doc("メタデータ")
  metadata: Metadata;
}
