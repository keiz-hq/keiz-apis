import "@typespec/http";
import "@typespec/openapi";
import "../foundation";
import "../keiz-foundation";
import "./models";

using Http;
using OpenAPI;
using Foundation;

@service(#{ title: "Keiz! Web API" })
@info(#{
  version: "1.0.0",
  contact: #{
    name: "Keiz!",
    url: "https://ag-keiz.com",
    email: "hq@ag-keiz.com",
  },
  license: #{
    name: "Copyright © 2026 Keiz! Co., Ltd. All rights reserved.",
    url: "https://ag-keiz.com",
  },
})
@server("https://api.ag-keiz.com", "Production")
@server("https://stg.api.ag-keiz.com", "Staging")
@server("https://dev.api.ag-keiz.com", "Development")
@server("http://localhost:8080", "Local")
namespace KeizWebAPI {
  @route("/cars")
  @tag("Cars")
  interface Cars {
    @get list(@query recommended?: boolean): OkResponse &
      Body<{
        cars: Car[];
      }>;

    @get detail(@path id: uuid): OkResponse &
      Body<{
        car: Car;
      }>;
  }
}
