model AfterService {
  @doc("点検記録簿")
  inspection_record_book: Choice;

  @doc("定期点検整備")
  regular_inspection_and_maintenance: Choice;

  @doc("保証")
  guarantee: Choice;
}

model CreateAfterServicePayload {
  @doc("Choice ID")
  inspection_record_book_id: uuid;

  @doc("Choice ID")
  regular_inspection_and_maintenance_id: uuid;

  @doc("Choice ID")
  guarantee_id: uuid;
}

model UpdateAfterServicePayload {
  @doc("Choice ID")
  inspection_record_book_id?: uuid;

  @doc("Choice ID")
  regular_inspection_and_maintenance_id?: uuid;

  @doc("Choice ID")
  guarantee_id?: uuid;
}
