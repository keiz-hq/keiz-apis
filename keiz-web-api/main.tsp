import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";
import "./models.tsp";

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


/**
 * Get cars
 */
@tag("car")
@route("/cars")
@get
@summary("Get Cars")
op getCars(
  /**
   * Recommended
   */
  @query(#{ explode: true }) recommended?: boolean,
): Body<Car[]> | BadRequestResponse | {
  @statusCode statusCode: 500;
};

/**
 * Get a car
 */
@tag("car")
@route("/cars/{carId}")
@get
@summary("Get Car")
op getCar(...Parameters.carId): Car | NotFoundResponse | {
  @statusCode statusCode: 500;
};

namespace Parameters {
  model carId {
    /**
     * Car ID
     */
    @format("uuid") @path carId: string;
  }
}
