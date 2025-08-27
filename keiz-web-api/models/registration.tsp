model Registration {
  @doc("車台番号")
  chassis_number: string;

  @doc("型式")
  model_number: string;

  @doc("初度登録年月")
  first_registered_date: utcDateTime;

  @doc("有効期限の満了する日")
  expiration_date: utcDateTime;
}
