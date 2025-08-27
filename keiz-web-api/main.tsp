import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";
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
  license: #{ name: "All Rights Reserved", url: "https://ag-keiz.com" },
})
namespace KeizWebAPI;

@route("/cars")
namespace Cars {
  @get
  op getCars(@query(#{ explode: true }) recommended?: boolean): OkResponse &
    Body<Car[]>;

  @get
  op getCar(...Parameters.carId): (OkResponse & Car) | NotFoundResponse;
}
