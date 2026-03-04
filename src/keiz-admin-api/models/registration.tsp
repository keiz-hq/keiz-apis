namespace KeizAdminAPI {
  model Registration {
    @doc("車台番号")
    chassis_number: string;

    @doc("型式")
    model_number: string;

    @doc("原動機の型式")
    engine_model_number: string;

    @doc("型式指定番号")
    designation_number: string;

    @doc("類別区分番号")
    classification_number: string;

    @doc("運輸支局名: https://www.airia.or.jp/info/number/01.html")
    place: string;

    @doc("自動車の種別による分類番号")
    class_number: string;

    @doc("かな")
    kana: string;

    @doc("一連指定番号")
    serial_number: string;

    @doc("初度登録年月")
    first_registered_date: utcDateTime;

    @doc("登録年月日/交付年月日")
    last_registered_date: utcDateTime;

    @doc("有効期限の満了する日")
    expiration_date: utcDateTime;
  }

  model UpdateRegistrationPayload {
    @doc("車台番号")
    chassis_number?: string;

    @doc("型式")
    model_number?: string;

    @doc("原動機の型式")
    engine_model_number?: string;

    @doc("型式指定番号")
    designation_number?: string;

    @doc("類別区分番号")
    classification_number?: string;

    @doc("運輸支局名: https://www.airia.or.jp/info/number/01.html")
    place?: string;

    @doc("自動車の種別による分類番号")
    class_number?: string;

    @doc("かな")
    kana?: string;

    @doc("一連指定番号")
    serial_number?: string;

    @doc("初度登録年月")
    first_registered_date?: utcDateTime;

    @doc("登録年月日/交付年月日")
    last_registered_date?: utcDateTime;

    @doc("有効期限の満了する日")
    expiration_date?: utcDateTime;
  }
}
