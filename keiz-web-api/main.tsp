import "@typespec/http";
import "@typespec/openapi";
import "./models/afterService.tsp";
import "./models/car.tsp";
import "./models/choice.tsp";
import "./models/cost.tsp";
import "./models/image.tsp";
import "./models/metadata.tsp";
import "./models/price.tsp";
import "./models/registration.tsp";
import "./models/repairHistory.tsp";
import "./models/website.tsp";
import "./parameters.tsp";
import "./uuid.tsp";

using Http;
using OpenAPI;

@service(#{ title: "Keiz! Web API" })
@info(#{
  version: "1.0.0",
  contact: #{
    name: "Keiz!",
    url: "https://ag-keiz.com",
    email: "hq@ag-keiz.com",
  },
  license: #{
    name: "Copyright © 2025 Keiz! Co., Ltd. All rights reserved.",
    url: "https://ag-keiz.com",
  },
})
@server("https://api.ag-keiz.com", "Production")
@server("https://stg.api.ag-keiz.com", "Staging")
@server("https://dev.api.ag-keiz.com", "Development")
@server("http://localhost:8080", "Local")
namespace KeizWebAPI;

@route("/cars")
namespace Cars {
  @get
  op list(@query(#{ explode: true }) recommended?: boolean): OkResponse &
    Body<Car[]>;

  @get
  op get(...Parameters.carId): (OkResponse & Car) | NotFoundResponse;
}
